#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "sipcontroller.h"

#include <QtWebSockets/QWebSocketServer>
#include <QtWebChannel>

#ifdef QT_WEBVIEW_WEBENGINE_BACKEND
#include <QtWebEngine>
#endif // QT_WEBVIEW_WEBENGINE_BACKEND

#include "utils.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    #ifdef QT_WEBVIEW_WEBENGINE_BACKEND
        QtWebEngine::initialize();
    #endif // QT_WEBVIEW_WEBENGINE_BACKEND

    SipController sipua;

    sipua.setServerUrl("sip.whisperr.com");
    sipua.setUser("device1");
    sipua.setPassword("device1");
    sipua.setBuddy("pete@sip.whisperr.com");
    //sipua._contr = &sipua;

    //if (option[0] == 'h')
    //   pjsua_call_hangup_all();
    //}

    // Destroy pjsua
    // sipua.destroy();


    QWebSocketServer server(QStringLiteral("QWebChannel Standalone Example Server"),
        QWebSocketServer::NonSecureMode);
    if (!server.listen(QHostAddress::LocalHost, 12345)) {
        qFatal("Failed to open web socket server.");
        return 1;
    }

    // wrap WebSocket clients in QWebChannelAbstractTransport objects
    WebSocketClientWrapper clientWrapper(&server);

    // setup the channel
    QWebChannel channel;
    QObject::connect(&clientWrapper, &WebSocketClientWrapper::clientConnected,
        &channel, &QWebChannel::connectTo);

    channel.registerObject("mySipUa", &sipua);

    Bridge myBridge;
    channel.registerObject("myBridge", &myBridge);


    const QString initialUrl =
        //QStringLiteral( "http://sip.whisperr.com:8061/Welcome%20Screen/WelcomeScreen.html");
        //QStringLiteral( "10.0.2.2/index3.html");
        //QStringLiteral( "10.0.2.2/index2.html");
        QStringLiteral( "http://sip.whisperr.com:8061/index3.html");

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    //context->setContextProperty(QStringLiteral("channel"), &channel);
    context->setContextProperty(QStringLiteral("sipua"), &sipua);
    context->setContextProperty(QStringLiteral("utils"), new Utils(&engine));
    context->setContextProperty(QStringLiteral("initialUrl"), Utils::fromUserInput(initialUrl));
    //context->setContextProperty(QStringLiteral("myBridge"), &myBridge);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
