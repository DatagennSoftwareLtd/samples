import QtQuick 2.0
import QtQuick.Controls 1.2

import ItemType 1.0

Item {
    property Component mycomponent: myCheckerDelegate
    property int mywidth: parent.width
    id: myitem

    Component {
        id: myCheckerDelegate

        Rectangle {
            height: 30
            width: mywidth//150//parent.width //200

            property int parentwidth: parent.width

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
                    console.log(parentwidth);
                    console.log(myitem.mywidth);

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
}
