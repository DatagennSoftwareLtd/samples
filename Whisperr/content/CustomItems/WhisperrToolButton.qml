import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Rectangle {
    id: menuButton

    property string pressedColor: "#ff9571"
    property string unpressedColor: "transparent"
    property string iconSource: ""

    signal clicked()

    anchors.verticalCenter: parent.verticalCenter
    antialiasing: true
    radius: 4
    color: backmouse.pressed ? pressedColor : unpressedColor

    Behavior on opacity { NumberAnimation{} }
    Image {
        width: parent.height*0.8
        height: parent.height*0.8
        anchors.centerIn: parent
        source: iconSource
    }
    MouseArea {
        id: backmouse
        anchors.fill: parent
        //anchors.margins: -10
        onClicked: { console.log("menuButton clicked"); menuButton.clicked(); }
    }
}


