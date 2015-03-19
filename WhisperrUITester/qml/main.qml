import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

ApplicationWindow {
    visible: true
    width: 300
    height: 800

    Rectangle{
        id: iruRect
        width: parent.width
        height: 50

        Item {
            id: iruItem
            property alias text: gmlUri.text
            width: 180; height: iruRect.height
            anchors.left: iruRect.left
            anchors.right: loadButton.left

            BorderImage {
                source: "qrc:/images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: gmlUri
                color: "#151515"; selectionColor: "green"
                font.pixelSize:18; font.bold: true
                width: parent.width-16
                height: iruRect.height
                anchors.centerIn: parent
                verticalAlignment: TextInput.AlignVCenter
                //focus: true
                text: "http://rolen.whisperr.com:8061/march/WLIS/.qml"
            }
        }


        Button {
            id: loadButton
            text: "Go"
            anchors.right: iruRect.right
            height: iruRect.height
            onClicked:
            {
                Qt.inputMethod.commit();
                Qt.inputMethod.hide();
                // load .qml
                loader.source = "";
                loader.source = iruItem.text; //gmlUri.text
                console.log(iruItem.text);
            }
        }
    }

    Loader {
        id: loader
        //anchors.fill: parent
        anchors.top: iruRect.bottom
        anchors.bottom: parent.bottom //status.top
        width: parent.width

        onStatusChanged: {
            if (loader.status == Loader.Null) statusText.text = "Inactive"
            else if (loader.status == Loader.Ready) statusText.text = "Ready"
            else if (loader.status == Loader.Loading) statusText.text = "Loading"
            else if (loader.status == Loader.Error) statusText.text = "Error"
        }

        Connections {
            target: loader.item
            onMessage: statusText.text = msg;
        }
    }


    statusBar: StatusBar {
        id: status
            RowLayout {
                id: rowLayout
                anchors.fill: parent
                Label {
                    id: statusText
                    text: "Ready"
                }

                Label {
                    id: progressText
                    anchors.right: rowLayout.right
                    text: loader.progress
                }
            }
        }

}
