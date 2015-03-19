import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 800

    Rectangle{
        id: buttonsRect
        width: parent.width
        height: 300
        anchors.top: parent.top

        Button {
            id: loginButton
            text: "Login"
            height: 60
            width: buttonsRect.width
            anchors.top: buttonsRect.top
            anchors.margins: 5
            onClicked: {
                ;
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
                ;
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
                ;
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
                ;
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
                ;
            }
        }

    }
}
