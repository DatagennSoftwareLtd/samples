import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Item {
    id: main
    anchors.fill: parent

    Rectangle{
        id: form
        height: parent.height/5
        width: parent.width
        anchors.centerIn: parent

        Text{
             id: textlabel
             anchors.left: form.left
             anchors.top: form.top
             text: "vibration time, ms:"
             height: form.height/2
        }

        TextField{
            id: ms
            anchors.left: textlabel.right
            anchors.right: form.right
            anchors.top: form.top
            height: form.height/2
            text: "300"
        }
        Button{
            text: "start"
            anchors.bottom: form.bottom
            width: form.width
            height: form.height/2
            onClicked: {
                vibration.setVibration(ms.text);
            }
        }
    }



}
