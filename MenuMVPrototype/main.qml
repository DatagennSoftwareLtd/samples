import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    MainForm {
        anchors.fill: parent

        Component {
            id: myDelegate

            Rectangle {
                height: 30
                width: parent.width

                Text {
                    text: name
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pixelSize: 14
                }
                Text {
                    text: value
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pixelSize: 14
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(model.value === "On")
                            model.value = "Off"
                        else
                            model.value = "On"

                        //model.name += "1";
                    }
                }
            }
        }

        ListView {
            id: view1
            anchors { top: parent.top; left: parent.left; bottom: parent.bottom }
            width: parent.width / 2
            spacing: 5

            delegate: myDelegate
            model: mainMenuModel.list
        }

        ListView {
            id: view2
            anchors { top: parent.top; right: parent.right; bottom: parent.bottom }
            width: parent.width / 2
            spacing: 5

            delegate: myDelegate
            model: mainMenuModel.list
        }
    }
}
