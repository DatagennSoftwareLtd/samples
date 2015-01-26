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

    toolBar: ToolBar {
        id: navigationBar
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: myButton
                text: myBridge.someProperty
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
