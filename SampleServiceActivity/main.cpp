#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "servicecontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    ServiceController* whisperrService = new ServiceController();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("whisperrService"), whisperrService);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
