import QtQuick 2.4
import QtQuick.Controls 1.2

import ItemType 1.0

Item {
    property Component mycomponent: myEditDelegate
    property int mywidth: parent.width
    id: myitem

    Component {
        id: myEditDelegate

        //property int height: 30
        //property int width: 150

        Rectangle {
            height: 30
            width: myitem.mywidth //200

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
}
