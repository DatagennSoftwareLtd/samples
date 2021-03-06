import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtWebView 1.0
import QtQuick.Controls.Styles 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 250
    minimumWidth: 300
    minimumHeight: 250

    //toolBar:
    ToolBar {
        id: toolBar
        width: parent.width
        height: 32

        style: ToolBarStyle {
            padding {
                left: 6
                right: 6
                top: 3
                bottom: 3
            }
            background: Rectangle {
                anchors.fill: parent
                color: "red"
            }
        }

        RowLayout {
            anchors.fill: parent
            ToolButton {
                width: toolBar.height
                height: toolBar.height
                Image {
                    source: "qrc:/images/menu_slider.png"
                    anchors.fill: parent
                }
            }
            ToolButton {
                width: toolBar.height
                height: toolBar.height
                anchors.right: parent.right
                Image {
                    source: "qrc:/images/menu_overflow.png"
                    anchors.fill: parent
                }
            }
        }
    }

    WebView {
    //WebEngineView {
       objectName: "Browser"
       id: webView
       //anchors.fill: parent
       anchors.top: toolBar.bottom
       anchors.bottom: parent.bottom
       width: parent.width
       url: initialUrl
       x: drawer.width + drawer.x
    }

    NavigationDrawer {
        id: drawer
        z: 100
        opacity: 0.5
        //anchors.top: toolBar.bottom
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#707070" }
            GradientStop { position: 1.0; color: "#000000" }
        }

        // Do Not Disturb
         Rectangle{
            id: dNDButtonRect
            width: parent.width
            height: 40
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#707070" }//"#1141a7" }
                GradientStop { position: 1.0; color: "#000000" }//"#0f1273"}
            }

            Text{
                text: "Do Not Disturb"
                id: dNDtitleTxt
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.pixelSize: 18
                color:  "#c1c3c8"
            }

            Text{
                text: "off"
                id: dNDstatusTxt
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.pixelSize: 18
                color:  "#c1c3c8"
            }

            MouseArea{
                width: parent.width
                height:  parent.height
                onClicked: {
                    if (dNDstatusTxt.text == "on")
                    {
                        dNDstatusTxt.text = "off"
                    }
                    else
                    {
                        dNDstatusTxt.text = "on"
                    }
                }
            }
        }
    }



/*
    toolBar: ToolBar {
        id: navigationBar
        RowLayout {
            anchors.fill: parent

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
*/
}
