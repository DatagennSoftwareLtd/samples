import QtQuick 2.4
import QtQuick.Controls 1.2

import ItemType 1.0

Item {
    property Component mycomponent: myEditDelegate
    property int mywidth: parent.width
    id: myitem

    Component {
        id: myEditDelegate

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
                            PropertyChanges { target: img; anchors.left: rect.left; anchors.margins: 2;}
                    },
                    State {
                            name: "right"; when: iconPos === ItemType.IpRight
                            PropertyChanges { target: img; anchors.right: rect.right; anchors.margins: 2;}
                    }
                ]

            }

            Text {
                id: t1
                text: name
                anchors.left: (iconPos === ItemType.IpLeft) ? img.right : parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter             
                color: "#c1c3c8"
                font.bold: true
                font.pixelSize: 14

            }

            TextInput {
                text: value
                anchors.right: (iconPos === ItemType.IpLeft) ? parent.right : img.left
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                color: "#c1c3c8"
                font.bold: true
                font.pixelSize: 14
                maximumLength: 4

                onEditingFinished: {
                    model.value = text
                    console.log(text);
                }
            }

            /*
            MouseArea{
                anchors.fill:  parent
                propagateComposedEvents: true
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
            */

        }
    }
}
