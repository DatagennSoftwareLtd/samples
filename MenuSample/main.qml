import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.3

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        anchors.fill: parent


        TabView {
            id: frame
            anchors.fill: parent
            anchors.margins: 4
            Tab {
                title: "Settings|qrc:/images/settings.png"
                //iconSource: "Settings|qrc:/images/settings.png"
            }

            Tab { title: "Calls|qrc:/images/call_chat.png" }
            Tab { title: "IM|qrc:/images/talk_chat.png" }

            style: TabViewStyle {
                frameOverlap: 1
                tab: Rectangle {
                    color: styleData.selected ? "steelblue" :"lightsteelblue"
                    border.width: 0
                    implicitWidth: (parent.control.width + 3) / 3
                    implicitHeight: 40
                    radius: 0

                    Image {
                        id: img
                        anchors.centerIn: parent
                        source: styleData.title.split("|")[1]
                    }
                    /*
                    Text {
                        anchors.top: img.bottom
                        anchors.centerIn: parent
                        text: styleData.title.split("|")[0]
                    }*/

                }
            }
        }

        /*
        button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))
        */
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
