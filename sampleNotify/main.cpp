#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQuick>

#include "notificationclient.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    NotificationClient *notificationClient = new NotificationClient(&view);
    view.engine()->rootContext()->setContextProperty(QLatin1String("notificationClient"),
                                                     notificationClient);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.show();
/*
    QQmlApplicationEngine engine;

    NotificationClient *notificationClient = new NotificationClient();

    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("notificationClient"), notificationClient);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
*/
    return app.exec();
}
