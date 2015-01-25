import QtQuick 2.0
import QtQuick.Controls 1.3

import ItemType 1.0

Item {
    property Component mycomponent: myButtonDelegate
    property int mywidth: parent.width
    id: myitem

    Component {
        id: myButtonDelegate

        Rectangle {
            id: rect
            height: 30
            width: myitem.mywidth
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
                            PropertyChanges { target: img; anchors.left: rect.left; anchors.margins: 2;  }
                    },
                    State {
                            name: "right"; when: iconPos === ItemType.IpRight
                            PropertyChanges { target: img; anchors.right: rect.right; anchors.margins: 2; }
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

            MouseArea{
                anchors.fill:  parent
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

            /*
            ButtonCustom {
                id: t1
                text: name
                //anchors.left: parent.left
                //anchors.leftMargin: 10
                //anchors.verticalCenter: parent.verticalCenter
                anchors.fill: parent
                //font.bold: true
                //font.pixelSize: 14
            }
            */
        }
    }
}
