import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 800

    Rectangle{
        id: iruRect
        width: parent.width
        height: 20

        TextInput {
            id: gmlUri
            //text: "http://vlad.whisperr.com:8061/WhisperrLogInScreen.qml"
            text: "http://rolen.whisperr.com:8061/"
            anchors.left: iruRect.left
            anchors.right: loadButton.left
        }
        Button {
            id: loadButton
            text: "Go"
            anchors.right: iruRect.right
            onClicked:
            {
                // load .qml
                testFile.source = gmlUri.text
            }
        }
    }

    Loader {
        id: testFile

        anchors.fill: parent
        //source: "Background_1.qml"

    }



}
