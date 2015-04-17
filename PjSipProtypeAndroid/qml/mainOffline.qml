import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 250
    minimumWidth: 300
    minimumHeight: 250
    color: "#FAFAFA"

    TabView {
        id: frame
        anchors.fill: parent
        anchors.margins: 4
        Tab {
            title: "Settings|qrc:/images/settings.png"
            sourceComponent: SettingsTab {
                anchors.fill: parent
            }
        }

        Tab { title: "Calls|qrc:/images/call_chat.png"
            sourceComponent: CallsTab {
                anchors.fill: parent
            }
        }
        Tab { title: "IM|qrc:/images/talk_chat.png"
            sourceComponent: MessagesTab {
                anchors.fill: parent
            }
        }

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
