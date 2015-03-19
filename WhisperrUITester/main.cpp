#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    //android:theme="@style/splashScreenTheme"
    engine.load(QUrl(QStringLiteral("qrc:/qml/init.qml")));

    return app.exec();
}
