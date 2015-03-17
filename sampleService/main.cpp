#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCoreApplication>

int main(int argc, char *argv[])
{
    /*
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
    */
    QCoreApplication a(argc, argv);
    qDebug("Qt running !");
    return a.exec();
}
