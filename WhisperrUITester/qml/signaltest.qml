import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Item {
    id: main
    anchors.fill: parent
    focus: true
    signal message(string msg)

    MouseArea {
       anchors.fill: parent
       onClicked: main.message("clicked!")
    }
}
