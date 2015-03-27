import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 250
    minimumWidth: 300
    minimumHeight: 250
    color: "#FAFAFA"

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
                source: "qrc:/images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: serverInput
                text: sipua.serverUrl
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                //focus: true
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
                source: "qrc:/images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: userInput
                text: sipua.user
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                //focus: true
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
                source: "qrc:/images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: passwordInput
                text: sipua.password
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                //focus: true
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
            text: "buddy uri:"
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
                source: "qrc:/images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: buddyInput
                text: sipua.buddy
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                //focus: true
                onEditingFinished: {
                    sipua.buddy = text;
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: imRect
        width: parent.width
        height: 40
        anchors.top: buddyRect.bottom

        Text {
            id: imText
            text: "IM text:"
            font.bold: true
            font.pointSize: 16
            height: imRect.height
            anchors.left: imRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: imInput.text
            width: 180; height: imRect.height
            anchors.right: imRect.right
            BorderImage {
                source: "qrc:/images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: imInput
                text: "hello buddy"
                color: "#151515"; selectionColor: "green"
                font.pixelSize:14; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                //focus: true
                onEditingFinished: {
                    //sipua.buddy = text;
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: buttonsRect
        width: parent.width
        height: 60
        anchors.top: imRect.bottom

        Button {
            id: registrationButton
            text: "registration"
            height: buttonsRect.height
            width: parent.width/4 - 5
            anchors.left: buttonsRect.left
            anchors.margins: 5

            onClicked: {
                Qt.inputMethod.commit();
                Qt.inputMethod.hide();
                sipua.registered();
            }
        }

        Button {
            id: acceptButton
            text: "accept"
            height: buttonsRect.height
            width: parent.width/4 - 5
            anchors.left: registrationButton.right
            anchors.margins: 5

            onClicked : {
                sipua.acceptCall();
            }
        }

        Button {
            id: rejectButton
            text: "reject"
            height: buttonsRect.height
            width: parent.width/4 - 5
            anchors.left: acceptButton.right
            anchors.margins: 5

            onClicked : {
                sipua.rejectCall();
            }
        }

        Button {
            id: callButton
            text: "make call"
            height: buttonsRect.height
            width: parent.width/4 - 5
            anchors.right: buttonsRect.right
            anchors.margins: 5

            onClicked : {
                Qt.inputMethod.commit();
                Qt.inputMethod.hide();
                sipua.makeCall();
            }
        }
    }

    Button {
        id: imButton
        text: "send IM"
        height: 60
        width: parent.width
        anchors.top: buttonsRect.bottom
        anchors.margins: 5

        onClicked : {
            Qt.inputMethod.commit();
            Qt.inputMethod.hide();
            sipua.new_outgoing_im(buddyInput.text, imInput.text);
        }
    }

    TextArea {
        id: log
        width: parent.width
        // height: 350
        anchors.top: imButton.bottom
        anchors.bottom: parent.bottom
        //text: sipua.statusMessage

        Connections {
            target: sipua
            onStatusMessageChanged: {
                var oldText = log.text;
                log.text = oldText + "\n" + msg;
            }

        }
    }
/*
    statusBar: StatusBar {

                Label {
                    id: statusText
                    text: sipua.statusMessage
                }

        }
*/
}
