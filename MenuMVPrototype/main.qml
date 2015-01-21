import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    MainForm {
        anchors.fill: parent

        ListView {
            id: view1
            anchors { top: parent.top; left: parent.left; bottom: parent.bottom }
            width: parent.width / 2
            spacing: 5

            delegate: Item {
                height: 30
                width: parent.width

                Text { text: name }

                MouseArea {
                    anchors.fill: parent
                    onClicked: model.name += "1";
                }
            }
            model: mainMenuModel.list
        }

        ListView {
            id: view2
            anchors { top: parent.top; right: parent.right; bottom: parent.bottom }
            width: parent.width / 2
            spacing: 5

            delegate: Item {
                height: 30
                width: parent.width

                Text { text: name }

                MouseArea {
                    anchors.fill: parent
                    onClicked: model.name += "2";
                }
            }
            model: mainMenuModel.list
        }
    }
}
