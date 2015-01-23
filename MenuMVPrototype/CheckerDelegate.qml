import QtQuick 2.0
import QtQuick.Controls 1.2

import ItemType 1.0

Component {
    id: myCheckerDelegate

    //property int height: 30
    //property int width: 150

    Rectangle {
        height: 30
        width: 150//parent.width //200

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

                console.log("Checker");

                if(model.type === ItemType.ItChecker)
                {
                    if(model.value === "On")
                        model.value = "Off"
                    else
                        model.value = "On"
                }
                else
                    ;//console.log("Not Checker");
            }
        }
    }
}
