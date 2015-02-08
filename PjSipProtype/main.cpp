#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "sipcontroller.h"

int main(int argc, char *argv[])
{

    SipController sipua;

    sipua.setServerUrl("sip.whisperr.com");
    sipua.setUser("device1");
    sipua.setPassword("device1");

    /*
    //* Create pjsua first!
    sipua.create();

    //* Init pjsua
    sipua.init();

    //* Add UDP transport.
    sipua.addTransport();

    // Initialization is done, now start pjsua
    sipua.start();

    // Register to SIP server by creating SIP account.
    sipua.createSIPAccount();

    //* If URL is specified, make call to the URL.
    sipua.makeCall();
*/

    //if (option[0] == 'h')
    //   pjsua_call_hangup_all();
    //}

    //* Destroy pjsua
    // sipua.destroy();

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("sipua"), &sipua);


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
