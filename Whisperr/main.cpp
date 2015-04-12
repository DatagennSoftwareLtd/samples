#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "./src/restapi/facadeui.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    FacadeUI* facade = new FacadeUI();

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("facade"), facade);

    engine.load(QUrl(QStringLiteral("qrc:/content/init.qml")));

    return app.exec();
}
