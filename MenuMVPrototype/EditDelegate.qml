import QtQuick 2.4
import QtQuick.Controls 1.2
import ItemType 1.0

Component {
    id: myEditDelegate
    //property string delegateName: "EditDelegate"

    Rectangle {
        height: 30
        width: view1.width

        Text {
            id: t1
            text: name
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 14
        }

        TextInput {
            text: value
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 14
            onEditingFinished: {
                model.value = text
                console.log(text);
            }
        }
    }
}

