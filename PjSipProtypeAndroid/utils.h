#ifndef UTILS
#define UTILS

#include <QtCore/QObject>
#include <QUrl>
#include <QtWebChannel/QWebChannelAbstractTransport>

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

class QWebSocket;
class WebSocketTransport : public QWebChannelAbstractTransport
{
    Q_OBJECT
public:
    explicit WebSocketTransport(QWebSocket *socket);
    virtual ~WebSocketTransport();

    Q_INVOKABLE void sendMessage(const QJsonObject &message) Q_DECL_OVERRIDE;

private Q_SLOTS:
    void textMessageReceived(const QString &message);

private:
    QWebSocket *m_socket;
};

#include <QObject>
class QWebSocketServer;
class WebSocketTransport;

class WebSocketClientWrapper : public QObject
{
    Q_OBJECT

public:
    WebSocketClientWrapper(QWebSocketServer *server, QObject *parent = 0);

Q_SIGNALS:
    void clientConnected(WebSocketTransport* client);

private Q_SLOTS:
    void handleNewConnection();

private:
    QWebSocketServer *m_server;
};


#endif // UTILS

