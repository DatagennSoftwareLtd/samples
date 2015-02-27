#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "dbprovider.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    DbProvider* dbProvider = new DbProvider();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("dbProvider"), dbProvider);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
