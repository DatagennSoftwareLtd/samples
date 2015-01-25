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
            id: rect
            height: 30
            width: mywidth
            gradient:unpressedDelegateItem

            Gradient {
                id: unpressedDelegateItem
                GradientStop { position: 0.0; color: "#5e5e5e" }
                GradientStop { position: 1.0; color:  "#000000"}
            }
            Gradient {
                id: pressedDelegateItem
                GradientStop { position: 0.0; color:  "#5e5e5e"}
                GradientStop { position: 1.0; color:  "#000000"}
            }

            Image{
                id: img
                source: iconUrl
                height: parent.height
                width: (iconUrl === "" ) ? 0 : parent.height

                states: [
                    State {
                            name: "left"; when: iconPos === ItemType.IpLeft
                            PropertyChanges { target: img; anchors.left: rect.left; anchors.margins: 2;}
                    },
                    State {
                            name: "right"; when: iconPos === ItemType.IpRight
                            PropertyChanges { target: img; anchors.right: rect.right; anchors.margins: 2;}
                    }
                ]

            }


            Text {
                text: name
                anchors.left: (iconPos === ItemType.IpLeft) ? img.right : parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                color: "#c1c3c8"
                font.bold: true
                font.pixelSize: 14
            }
            Text {
                text: value
                anchors.right: (iconPos === ItemType.IpLeft) ? parent.right : img.left
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                color: "#c1c3c8"
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
                onPressed: {
                    rect.gradient = pressedDelegateItem
                    border.width = 2
                    border.color = "yellow"
                    //myRect.itemselected(index)
                }
                onReleased: {
                    border.width = 0
                    rect.gradient = unpressedDelegateItem
                }
            }
        }
    }
}
