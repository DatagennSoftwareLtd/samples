import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

/*
Window {
    visible: true
    MainForm {
        anchors.fill: parent
        mouseArea.onClicked: {
            Qt.quit();
        }

    }
}
*/
ApplicationWindow {
    visible: true
    width: 300
    height: 800
    WhisperrLogInScreen {
        anchors.fill: parent
    }
}
