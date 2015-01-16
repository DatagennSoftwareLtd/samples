#ifndef UTILS
#define UTILS

#include <QtCore/QObject>
#include <QUrl>

// Workaround: As of Qt 5.4 QtQuick does not expose QUrl::fromUserInput.
class Utils : public QObject {
    Q_OBJECT
public:
    Utils(QObject* parent = 0) : QObject(parent) { }
    Q_INVOKABLE static QUrl fromUserInput(const QString& userInput)
    {
        if (userInput.isEmpty())
            return QUrl::fromUserInput("about:blank");
        const QUrl result = QUrl::fromUserInput(userInput);
        return result.isValid() ? result : QUrl::fromUserInput("about:blank");
    }
};

class Bridge : public QObject {
    Q_OBJECT
public:
    Bridge(QObject* parent = 0) : QObject(parent), sum(0) { }
    Q_INVOKABLE QString fromHTML2QML()
    {
        return QString::number(sum);
    }
protected slots:
    void webViewShowMessageClicked (int number)
    {
        sum = number;
    }
protected:
    int sum;
};

#endif // UTILS

