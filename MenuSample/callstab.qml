import QtQuick 2.0

Rectangle {
    id: callsTab

    Text {
        id: srvText
        text: "server:"
        font.bold: true
        font.pointSize: 16
        height: serverRect.height
        anchors.centerIn: callsTab.Center
        anchors.margins: 5
    }
}

