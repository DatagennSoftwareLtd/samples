import QtQuick 2.0

Component {
    id: myCheckerDelegate
    //property string delegateName: "CheckerDelegate"

    Rectangle {
        height: 30
        width: view1.width

        Text {
            text: name
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 14
        }
        Text {
            text: value
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 14
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {

                console.log("Checker");

                if(type === ItemType.ItChecker)
                {
                    if(value === "On")
                        value = "Off"
                    else
                        value = "On"
                }
                else
                    ;//console.log("Not Checker");
            }
        }
    }
}
