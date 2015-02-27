import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 250
    minimumWidth: 300
    minimumHeight: 250

    Rectangle{
        id: buttonsRect
        width: parent.width
        height: 50
        anchors.top: parent.top
        //anchors.margins: 5

        Button {
            id: createDbButton
            text: "create"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: buttonsRect.left
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                dbProvider.create();
            }
        }

        Button {
            id: openDbButton
            text: "open"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: createDbButton.right
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                dbProvider.open();
            }
        }

        Button {
            id: closeDbButton
            text: "close"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: openDbButton.right
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                dbProvider.close();
            }
        }

        Button {
            id: removeDbButton
            text: "remove"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: closeDbButton.right
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                dbProvider.remove();
            }
        }
    }

}
