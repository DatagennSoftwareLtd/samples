import QtQuick 2.4

Rectangle {
    id: myRect
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#707070" }
        GradientStop { position: 1.0; color:  "#000000"}
    }

    signal itemselected(int index)

    property alias titleText: titleTxt.text
    property alias customModel: listView.model
    property alias customDelegate: listView.delegate

    Rectangle{
        id: titleRect
        width: parent.width
        height: 40
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#707070" }
            GradientStop { position: 1.0; color:  "#000000"}
        }
        Image {
            id: titleArrow
            width:  20
            height:  20
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            source: "images/arrowdown.png"

        }
        Text{
            id: titleTxt
            anchors.left: titleArrow.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 18
            color:  "#c1c3c8"
        }
        MouseArea{
            width: parent.width
            height:  parent.height
            onClicked: {
                if (myRect.state == "collapsed")
                {
                    myRect.state = ""
                }
                else
                {
                    myRect.state = "collapsed"
                }
            }
        }
    }

    ListView{
        id: listView
        width: parent.width
        height: parent.height-titleRect.height
        anchors.top: titleRect.bottom
        model: customModel
        delegate: customDelegate
    }

    states: [
        State {
            name: "collapsed"
            PropertyChanges {
                target: listView
                height: 0
                opacity: 0
            }
            PropertyChanges {
                target: myRect
                height: titleRect.height
            }
            PropertyChanges {
                target: titleArrow
                rotation: -90
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation { target: listView; property: "height"; duration: 300 }
            NumberAnimation { target: listView; property: "opacity"; duration: 300 }
            NumberAnimation { target: titleArrow; property: "rotation"; duration: 200 }
        }
    ]

    Component.onCompleted:  {
        myRect.height = titleRect.height+listView.contentHeight
    }
}
