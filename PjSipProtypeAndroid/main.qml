import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtWebView 1.0

ApplicationWindow {
    visible: true
    width: 300
    height: 250
    minimumWidth: 300
    minimumHeight: 250
    color: "#FAFAFA"

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

    WebView {
       objectName: "Browser"
       id: webView
       anchors.fill: parent
       url: initialUrl
    }

/*
    Rectangle{
        id: serverRect
        width: parent.width
        height: 40
        //color: parent.color

        Text {
            id: srvText
            text: "server:"
            font.bold: true
            font.pointSize: 16
            height: serverRect.height
            anchors.left: serverRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: serverInput.text
            width: 180; height: serverRect.height
            anchors.right: serverRect.right
            BorderImage {
                source: "images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: serverInput
                text: sipua.serverUrl
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    sipua.serverUrl = text;
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: userRect
        width: parent.width
        height: 40
        anchors.top: serverRect.bottom
        //color: parent.color

        Text {
            id: logText
            text: "user:"
            font.bold: true
            font.pointSize: 16
            height: userRect.height
            anchors.left: userRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: userInput.text
            width: 180; height: userRect.height
            anchors.right: userRect.right
            BorderImage {
                source: "images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: userInput
                text: sipua.user
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    sipua.user = text;
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: passwordRect
        width: parent.width
        height: 40
        anchors.top: userRect.bottom
        //color: parent.color

        Text {
            id: pswText
            text: "password:"
            font.bold: true
            font.pointSize: 16
            height: passwordRect.height
            anchors.left: passwordRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: passwordInput.text
            width: 180; height: passwordRect.height
            anchors.right: passwordRect.right
            BorderImage {
                source: "images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: passwordInput
                text: sipua.password
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    sipua.password = text;
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: buddyRect
        width: parent.width
        height: 40
        anchors.top: passwordRect.bottom

        Text {
            id: buddyText
            text: "call to:"
            font.bold: true
            font.pointSize: 16
            height: buddyRect.height
            anchors.left: buddyRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: buddyInput.text
            width: 180; height: buddyRect.height
            anchors.right: buddyRect.right
            BorderImage {
                source: "images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: buddyInput
                text: sipua.buddy
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    sipua.buddy = text;
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: buttonsRect
        width: parent.width
        height: 50
        anchors.top: buddyRect.bottom
        //anchors.margins: 5

        Button {
            id: registrationButton
            text: "registration"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: buttonsRect.left
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                sipua.create();
                sipua.init();
                sipua.addTransport();
                sipua.start();
                sipua.createSIPAccount();
                //statusText.text = "registered";
            }
        }

        Button {
            id: acceptButton
            text: "accept"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: registrationButton.right
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked : {
                sipua.acceptCall();
                //statusText.text = "accepted";
            }
        }

        Button {
            id: rejectButton
            text: "reject"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: acceptButton.right
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked : {
                sipua.rejectCall();
                //statusText.text = "rejected";
            }
        }

        Button {
            id: callButton
            text: "make call"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.right: buttonsRect.right
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked : {
                sipua.makeCall();
                //statusText.text = "calling";
            }
        }
    }
*/
    statusBar: StatusBar {
        id: statusBar
        RowLayout {
            anchors.fill: parent
            Label {
                anchors.right: parent.right
                text: webView.loadProgress == 100 ? qsTr("Done") : qsTr("Loading: ") + webView.loadProgress + "%"
            }
            Label {
                anchors.left: parent.left
                id: statusText
                text: sipua.statusMessage
                //text: myBridge.someProperty
            }
        }
    }
}
