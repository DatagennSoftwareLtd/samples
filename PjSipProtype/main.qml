import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

Window {
    visible: true
    width: 300
    height: 200
    minimumWidth: 300
    minimumHeight: 200
    color: "#FAFAFA"

    Rectangle{
        id: serverRect
        width: parent.width
        height: 40
        color: parent.color

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
        color: parent.color

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
        color: parent.color

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
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: buttonsRect
        width: parent.width
        height: 40
        anchors.top: buddyRect.bottom

        Button {
            id: registrationButton
            text: "registration"
            height: buttonsRect.height
            width: parent.width/2 - 10
            anchors.left: buttonsRect.left
            anchors.margins: 5
            anchors.topMargin: 5

            onClicked: {
                sipua.create();
                sipua.init();
                sipua.addTransport();
                sipua.start();
                sipua.createSIPAccount();
            }
        }

        Button {
            id: callButton
            text: "make call"
            height: buttonsRect.height
            width: parent.width/2 - 10
            anchors.right: buttonsRect.right
            anchors.margins: 5
            anchors.topMargin: 5

            onClicked : {
                sipua.makeCall();
            }
        }
    }
}
