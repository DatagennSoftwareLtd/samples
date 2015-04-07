#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "../UIAPIPrototype/facadeui.h"

#include "componentcachemanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    FacadeUI* facade = new FacadeUI();

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("facade"), facade);
    context->setContextProperty(QStringLiteral("componentCache"), new ComponentCacheManager(&engine));
    //engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    //android:theme="@style/splashScreenTheme"

    engine.load(QUrl(QStringLiteral("qrc:/qml/init.qml")));

    return app.exec();
}
