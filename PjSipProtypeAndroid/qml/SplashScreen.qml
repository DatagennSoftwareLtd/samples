import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

ApplicationWindow {
    id: splashScreen
    width: 320
    height: 480
    visible: true

    property alias progressBarValue: progressBar.currentValue
    Image {
        anchors.fill: parent
        source: "qrc:/images/splashscreen.png"
    }

    CustomProgressBar {
        id: progressBar
        width: splashScreen.width * 0.75
        anchors.horizontalCenter: parent.horizontalCenter
        maxValue: 100
    }

    Behavior on opacity { NumberAnimation { duration: 5000 } }
}
