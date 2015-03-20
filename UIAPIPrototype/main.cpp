#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "facadeui.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    FacadeUI* facade = new FacadeUI();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("facade"), facade);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
