#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include "notificationclient.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    NotificationClient *notificationClient = new NotificationClient();

    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QLatin1String("notificationClient"), notificationClient);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
