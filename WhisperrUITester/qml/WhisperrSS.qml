import QtQuick 2.4

Item {
    anchors.fill: parent
    Rectangle {
        id: background
        width: parent.width
        height: parent.height
        x: 0
        y: 0
        color: "#e74710"
    }
    Text {
        id: log_in_header
        text: "LOADING . . ."
        font.pixelSize: parent.height * 0.025
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        anchors.verticalCenter: splashscreen.verticalCenter
        anchors.horizontalCenter: splashscreen.horizontalCenter
        opacity: 1
    }

    Loader {
        id: splashscreen
        anchors.top: rr_layer.bottom
        anchors.topMargin: parent.height * 0.075
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.5
        height: parent.height * 0.4
        source: "ssload.qml"
    }
	
    Image {
        id: rr_layer
        source: "images/rr_layer.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.10       
        width: parent.width * 0.75
        height: parent.height * 0.20
        opacity: 1
    }
}
