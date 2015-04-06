import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    MainForm {
        id: main
        anchors.fill: parent

        property int backgroundNumber: 1

        width: 360
        height: 360

        Loader {
            id: background

            anchors.fill: parent
            //source: "http://10.0.2.2/Background_1.qml"
            source: "Background_1.qml"
            // file:///
            //onLoaded: { item.color = "green" }
        }

        Text
        {
            id: text
            color: "red"
            font.bold: true
            font.pointSize: 18
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                background.source = (main.backgroundNumber ==  1 ? "Background_2.qml" : "Background_1.qml")
                //background.setSource((main.backgroundNumber ==  1 ? "http://10.0.2.2/Background_2.qml" : "http://10.0.2.2/Background_1.qml"), { "opacity": 0.5 });
                main.backgroundNumber = (main.backgroundNumber == 1 ? 2 : 1)
                text.text = background.item.code;
            }
        }

    }
}
