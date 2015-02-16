#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "sipcontroller.h"

int main(int argc, char *argv[])
{

    SipController sipua;

    sipua.setServerUrl("sip.whisperr.com");
    sipua.setUser("device1");
    sipua.setPassword("device1");
    sipua.setBuddy("pete@sip.whisperr.com");
    sipua._contr = &sipua;

    //if (option[0] == 'h')
    //   pjsua_call_hangup_all();
    //}

    // Destroy pjsua
    // sipua.destroy();

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("sipua"), &sipua);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
