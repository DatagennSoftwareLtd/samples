import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Switch
{
    id: customSwitch
    property real parentHeight: parent.height

    style: SwitchStyle
    {
        groove: Rectangle
        {
            implicitWidth: parentHeight * 3
            implicitHeight: parentHeight
            radius: 8
            color: "#00000000"
            Rectangle {
                implicitWidth: parentHeight * 1.7
                implicitHeight: parentHeight
                radius: 8
                color: "#ff622e"
                border.width: 1
                border.color: "#ebebeb"
                anchors.left: parent.left

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * 0.20
                    anchors.verticalCenter: parent.verticalCenter
                    text: "ON"
                    font.pixelSize: parentHeight * 0.50
                    color: "#fff"
                }
            }
            Rectangle {
                implicitWidth: parentHeight * 1.7
                implicitHeight: parentHeight
                radius: 8
                color: "#bbbbbb"
                border.width: 1
                border.color: "#ebebeb"
                anchors.right: parent.right

                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: parent.width * 0.10
                    anchors.verticalCenter: parent.verticalCenter
                    text: "OFF"
                    font.pixelSize: parentHeight * 0.50
                    color: "#fff"
                }
            }
        }
        handle: Rectangle {
            implicitWidth: parentHeight * 1.7
            implicitHeight: parentHeight
            radius: 8
            color: "#ebebeb"
        }
    }
}


