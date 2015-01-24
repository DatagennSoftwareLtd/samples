import QtQuick 2.0
import QtQuick.Controls 1.3

Item {
    property Component mycomponent: myButtonDelegate
    property int mywidth: parent.width
    id: myitem

    Component {
        id: myButtonDelegate

        //property int height: 30
        //property int width: 150

        Rectangle {
            height: 30
            width: myitem.mywidth

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

            /*
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Button");
                }
            }
            */
        }
    }
}
