import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

//import QtWebKit 3.0
import QtWebView 1.0

import QtWebChannel 1.0
//import "qwebchannel.js" as WebChannel

import Qt.WebSockets 1.0

//import QtWebKit.experimental 1.0

ApplicationWindow {
    title: "Web Browser"
    id: mainWindow
    width: 320
    height: 480
    visible: true

/*
    WebSocketServer {
            id: server
            listen: true
            onClientConnected: {

                //webChannel.connectTo(webSocket);
                myButton.text = qsTr("Client");

                new WebChannel.QWebChannel(webSocket, function(ch) {
                     root.channel = ch;

                     //connect to the changed signal of the userList property
                     ch.objects.chatserver.userListChanged.connect(function(args) {
                         userlist.text = '';
                         ch.objects.chatserver.userList.forEach(function(user) {
                             userlist.text += user + '\n';
                         });
                     });
                     //connect to the newMessage signal
                     ch.objects.chatserver.newMessage.connect(function(time, user, message) {
                         chat.text = chat.text + "[" + time + "] " + user + ": " +  message + '\n';
                     });
                     //connect to the keep alive signal
                     ch.objects.chatserver.keepAlive.connect(function(args) {
                         if (loginName.text !== '')
                             //and call the keep alive response method as an answer
                             ch.objects.chatserver.keepAliveResponse(loginName.text)
                    });
                });

            }
            onErrorStringChanged: {
                ;
            }
        }

        WebSocket {
            id: socket
            url: server.url
            onStatusChanged: {
                if (socket.status == WebSocket.Error) {
                    ;
                } else if (socket.status == WebSocket.Closed) {
                    ;
                }
            }
        }
*/
    /*
        QtObject {
            id : myBridge
            WebChannel.id: "myBridge"
            property int sum: 0
        }
*/
        /*
        WebChannel {
            id: webChannel
            registeredObjects:  [ myBridge ]
            //transports: [ socket ]
        }
        */

    toolBar: ToolBar {
        id: navigationBar
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: myButton
                text: myBridge.someProperty //qsTr("Result") bridge.fromHTML2QML//
                //onClicked: webView.goBack()
                //enabled: webView.canGoBack

            }

            ToolButton {
                id: backButton
                text: qsTr("Back")
                iconSource: "qrc:/images/left-32.png"
                onClicked: webView.goBack()
                enabled: webView.canGoBack
            }

            ToolButton {
                id: forwardButton
                text: qsTr("Forward")
                iconSource: "qrc:/images/right-32.png"
                onClicked: webView.goForward()
                enabled: webView.canGoForward
            }

            TextField {
                Layout.fillWidth: true
                id: urlField
                inputMethodHints: Qt.ImhUrlCharactersOnly | Qt.ImhPreferLowercase
                text: webView.url
                onEditingFinished: {
                    webView.url = utils.fromUserInput(urlField.text);
                }
            }

            ToolButton {
                id: goButton
                text: qsTr("Go")
                onClicked: {
                    webView.url = utils.fromUserInput(urlField.text)
                }
            }
        }
    }

    statusBar: StatusBar {
        id: statusBar
        RowLayout {
            anchors.fill: parent
            Label { text: webView.loadProgress == 100 ? qsTr("Done") : qsTr("Loading: ") + webView.loadProgress + "%" }
        }
    }


    WebView {
        objectName: "Browser"
        id: webView
        anchors.fill: parent
        url: initialUrl
    }

}
