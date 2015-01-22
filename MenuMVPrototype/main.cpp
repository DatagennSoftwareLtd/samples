#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include "menuitem.h"
#include "mainmenumodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<MenuItem>("ItemType", 1, 0, "ItemType");
    //qmlRegisterType<MenuItem>();

    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("mainMenuModel"), new MainMenuModel);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
