#include "mainwindow.h"
#include <QApplication>

#include "qwebchannel.h"

#include <QCoreApplication>
#include <QUrl>
#include <QDebug>

#include <QApplication>
#include <QDialog>
#include <QVariantMap>
#include <QDesktopServices>
#include <QUrl>
#include <QDebug>

#include <QtWebSockets/QWebSocketServer>

#include "websocketclientwrapper.h"
#include "websockettransport.h"
#include "chatserver.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();

    QWebSocketServer server(QStringLiteral("QWebChannel Standalone Example Server"),
                               QWebSocketServer::NonSecureMode);
    if (!server.listen(QHostAddress::LocalHost, 12345)) {
       qFatal("Failed to open web socket server.");
       return 1;
    }

    // wrap WebSocket clients in QWebChannelAbstractTransport objects
    WebSocketClientWrapper clientWrapper(&server);

    // setup the channel
    QWebChannel channel;
    QObject::connect(&clientWrapper, &WebSocketClientWrapper::clientConnected,
                    &channel, &QWebChannel::connectTo);

    /*
    // setup the dialog and publish it to the QWebChannel
    Dialog dialog;
    channel.registerObject(QStringLiteral("dialog"), &dialog);

    // open a browser window with the client HTML page
    QUrl url = QUrl::fromLocalFile("e:/index.html"); //BUILD_DIR
    url.setQuery(QStringLiteral("webChannelBaseUrl=") + server.serverUrl().toString());
    QDesktopServices::openUrl(url);

    dialog.displayMessage(QObject::tr("Initialization complete, opening browser at %1.").arg(url.toDisplayString()));
*/
    // setup the dialog and publish it to the QWebChannel
    ChatServer* chatserver = new ChatServer(&a);
    channel.registerObject("chatserver", chatserver);

    return a.exec();
}
