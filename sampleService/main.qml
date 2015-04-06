import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 800

    Button {
        id: startButton
        text: "Start"
        height: 60
        width: buttonsRect.width
        anchors.top: parent.top
        anchors.margins: 5
        onClicked: {
            whisperrService.startService();
        }
    }
    Button {
        id: stopButton
        text: "Stop"
        height: 60
        width: buttonsRect.width
        anchors.top: startButton.top
        anchors.margins: 5
        onClicked: {
            whisperrService.stopService();
        }
    }
}
