import QtQuick 2.4
import QtQuick.Controls 1.2

ApplicationWindow {
    title: "Menu Prototype"
    id: mainWindow
    width: 320
    height: 480
    visible: true

    toolBar: ToolBar {
        id: toolBar

    }

    BurnerTelMenu {
        //id: drawer

        opacity: 0.5
        //anchors.top: navigationBar.bottom
        anchors.top: toolBar.bottom
        anchors.bottom: parent.bottom

        position: Qt.LeftEdge

    }
}
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
