#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "sipcontroller.h"
#include "bridgejs.h"

#include <QtWebSockets/QWebSocketServer>
#include <QtWebChannel>

#ifdef QT_WEBVIEW_WEBENGINE_BACKEND
#include <QtWebEngine>
#endif // QT_WEBVIEW_WEBENGINE_BACKEND

#include "utils.h"

#include "./src/db/provider/dbprovider.h"
#include "./src/db/logs/messageitem.h"
#include "./src/db/logs/messagemodel.h"

/* global callback/logger object */
//extern void *globalSipUa;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    #ifdef QT_WEBVIEW_WEBENGINE_BACKEND
        QtWebEngine::initialize();
    #endif // QT_WEBVIEW_WEBENGINE_BACKEND

    SipController* sipua = new SipController();
    BridgeJS* bridgeJS = new BridgeJS();
    //bridgeJS->setSipUa(sipua);

    QObject::connect(bridgeJS, SIGNAL(makeCall()), sipua, SLOT(makeCall()));
    QObject::connect(bridgeJS, SIGNAL(acceptCall()), sipua, SLOT(acceptCall()));
    QObject::connect(bridgeJS, SIGNAL(rejectCall()), sipua, SLOT(rejectCall()));
    QObject::connect(bridgeJS, SIGNAL(registered()), sipua, SLOT(registered()));
    QObject::connect(sipua, SIGNAL(statusMessageChanged(const QString)),
                     bridgeJS, SLOT(logMessageSlot(QString)));

    QObject::connect(bridgeJS, SIGNAL(outgoingIm(QString, QString)),
                     sipua, SLOT(new_outgoing_im(QString, QString)));

    //------------------------------------------------------------
    QObject::connect(bridgeJS, SIGNAL(serverUrlChanged(const QString)),
                     sipua,    SLOT(setServerUrl(const QString&)));
    QObject::connect(bridgeJS, SIGNAL(userChanged(const QString)),
                     sipua,    SLOT(setUser(const QString&)));
    QObject::connect(bridgeJS, SIGNAL(passwordChanged(const QString)),
                     sipua,    SLOT(setPassword(const QString&)));
    QObject::connect(bridgeJS, SIGNAL(buddyChanged(const QString)),
                     sipua,    SLOT(setBuddy(const QString&)));

    bridgeJS->setServerUrl("sip.whisperr.com");
    bridgeJS->setUser("device1");
    bridgeJS->setPassword("device1");
    bridgeJS->setBuddy("pete@sip.whisperr.com");

    sipua->setServerUrl("sip.whisperr.com");
    sipua->setUser("device1");
    sipua->setPassword("device1");
    sipua->setBuddy("pete@sip.whisperr.com");

    //bridgeJS->_contr = sipua;

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

   // channel.registerObject("mySipUa", sipua);
    channel.registerObject("bridgeJS", bridgeJS);

    const QString initialUrl =
        //QStringLiteral( "10.0.2.2/index3.html");
        //QStringLiteral( "http://sip.whisperr.com:8061/vlad/index3.html");
        QStringLiteral( "http://vlad.whisperr.com:8061/index3.html");

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();

    DbProvider* dbProvider = new DbProvider();
    dbProvider->createWhisperrDB();

    MessageModel* messages = new MessageModel(dbProvider);
    messages->loadLogs();
    qmlRegisterType<MessageItem>("MessageItem", 1, 0, "MessageItem");
    context->setContextProperty(QStringLiteral("messagesModel"), messages);

    QObject::connect(sipua,
        SIGNAL(newMessage(const QString&, const QString&, const QString&, const QString&)),
                     messages,
        SLOT(addMessage(const QString&, const QString&, const QString&, const QString&)));


    //context->setContextProperty(QStringLiteral("channel"), &channel);
    context->setContextProperty(QStringLiteral("sipua"), sipua);
    context->setContextProperty(QStringLiteral("utils"), new Utils(&engine));
    context->setContextProperty(QStringLiteral("initialUrl"), Utils::fromUserInput(initialUrl));

    engine.load(QUrl(QStringLiteral("qrc:/qml/init.qml")));

    return app.exec();
}
