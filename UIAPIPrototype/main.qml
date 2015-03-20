import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 800

    Rectangle{
       id: uidRect
       width: parent.width
       height: 50

       Text {
           id: uidText
           text: "username/email:"
           font.bold: true
           font.pointSize: 16
           height: uidRect.height
           anchors.left: uidRect.left
           anchors.margins: 5
       }

       Item {
           property alias text: uidInput.text
           width: 180; height: uidRect.height
           anchors.right: uidRect.right
           BorderImage {
               source: "qrc:/images/lineedit.sci"
               anchors.fill: parent
           }
           TextInput {
               id: uidInput
               text: "sean1@datagenn.com"
               color: "#151515"; selectionColor: "green"
               font.pixelSize:14; font.bold: true
               width: parent.width-16
               anchors.centerIn: parent
           }
       }
    }

    Rectangle{
       id: pwdRect
       width: parent.width
       height: 50
       anchors.top: uidRect.bottom

       Text {
           id: pwdText
           text: "password:"
           font.bold: true
           font.pointSize: 16
           height: pwdRect.height
           anchors.left: pwdRect.left
           anchors.margins: 5
       }

       Item {
           property alias text: pwdInput.text
           width: 180; height: pwdRect.height
           anchors.right: pwdRect.right
           BorderImage {
               source: "qrc:/images/lineedit.sci"
               anchors.fill: parent
           }
           TextInput {
               id: pwdInput
               text: "sean1"
               color: "#151515"; selectionColor: "green"
               font.pixelSize:14; font.bold: true
               width: parent.width-16
               anchors.centerIn: parent
           }
       }
   }


    Rectangle{
        id: buttonsRect
        width: parent.width
        height: 350
        anchors.top: pwdRect.bottom

        Button {
            id: loginButton
            text: "Login"
            height: 60
            width: buttonsRect.width
            anchors.top: buttonsRect.top
            anchors.margins: 5
            onClicked: {
                facade.login(uidInput.text, pwdInput.text, "en");
            }
        }
        Button {
            id: resetPasswordButton
            text: "Reset Password"
            height: 60
            width: buttonsRect.width
            anchors.top: loginButton.bottom
            anchors.margins: 5
            onClicked: {
                facade.resetPassword(uidInput.text, "en");
            }
        }
        Button {
            id: signupButton
            text: "Signup"
            height: 60
            width: buttonsRect.width
            anchors.top: resetPasswordButton.bottom
            anchors.margins: 5
            onClicked: {
                facade.signup(uidInput.text, pwdInput.text, "en");
            }
        }
        Button {
            id: backupButton
            text: "Backup"
            height: 60
            width: buttonsRect.width
            anchors.top: signupButton.bottom
            anchors.margins: 5
            onClicked: {
                //facade.backup() todo
            }
        }
        Button {
            id: restoreButton
            text: "Restore"
            height: 60
            width: buttonsRect.width
            anchors.top: backupButton.bottom
            anchors.margins: 5
            onClicked: {
                //facade.restore() todo
            }
        }

    }
    TextArea {
        id: log
        width: parent.width
        anchors.top: buttonsRect.bottom
        anchors.bottom: parent.bottom

        Connections {
            target: facade
            onStatusMessageChanged: {
                var oldText = log.text;
                log.text = oldText + "\n" + msg;
            }

        }
    }

}
