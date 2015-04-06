import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

ApplicationWindow {
    title: qsTr("Whisperr")
    width: 640
    height: 480
    visible: true
    id: whisperrMain
    color: "#e74710"

    toolBar: BorderImage {
        border.bottom: 8
        source: "qrc:/images/toolbar.png"
        width: whisperrMain.width
        height: whisperrMain.height * 0.075

        Rectangle {
            id: backButton
            height: toolBar.height*0.8
            width: toolBar.height*0.8
            anchors.left: parent.left
            anchors.leftMargin: 5
            //opacity: stackView.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            radius: 4
            color: backmouse1.pressed ? "#ff9571" : "transparent"
            Behavior on opacity { NumberAnimation{} }
            Image {
                width: parent.height
                height: parent.height
                anchors.centerIn: parent
                source: "qrc:/images/navigation_next_item.png"
            }
            MouseArea {
                id: backmouse1
                anchors.fill: parent
                anchors.margins: -10
                //onClicked: stackView.pop()
            }
        }

        Image {
           id: contactsicon
           anchors.left: backButton.right
           anchors.leftMargin: toolBar.height * 0.30
           anchors.top: toolBar.top
           anchors.topMargin: toolBar.height * 0.10
           width: toolBar.height * 0.8
           height: toolBar.height * 0.8
           source: "qrc:/images/contacts.png"
       }

       Text {
           id: person
           anchors.left: contactsicon.right
           anchors.leftMargin: toolBar.height * 0.20
           anchors.top: toolBar.top
           anchors.topMargin: toolBar.height * 0.15
           text: "Person 1"
           font.pixelSize: toolBar.height * 0.40
           color: "#fff"
       }

       Text {
           id: personstatus
           anchors.left: contactsicon.right
           anchors.leftMargin: toolBar.height * 0.30
           anchors.top: person.bottom
           text: "Online"
           font.pixelSize: toolBar.height * 0.20
           color: "#fff"
       }

       // search Button
       Rectangle {
           id: searchButton
           height: toolBar.height*0.8
           width: toolBar.height*0.8
           anchors.right: newmessageButton.left
           anchors.leftMargin: 5
           //opacity: stackView.depth > 1 ? 1 : 0
           anchors.verticalCenter: parent.verticalCenter
           antialiasing: true
           radius: 4
           color: backmouse2.pressed ? "#ff9571" : "transparent"
           Behavior on opacity { NumberAnimation{} }
           Image {
               width: parent.height*0.8
               height: parent.height*0.8
               anchors.centerIn: parent
               source: "qrc:/images/searchicon.png"
           }
           MouseArea {
               id: backmouse2
               anchors.fill: parent
               anchors.margins: -10
               //onClicked: stackView.pop()
           }
       }

       // newmessage Button
       Rectangle {
           id: newmessageButton
           height: toolBar.height*0.8
           width: toolBar.height*0.8
           anchors.right: settingsButton.left
           anchors.leftMargin: 5
           //opacity: stackView.depth > 1 ? 1 : 0
           anchors.verticalCenter: parent.verticalCenter
           antialiasing: true
           radius: 4
           color: backmouse3.pressed ? "#ff9571" : "transparent"
           Behavior on opacity { NumberAnimation{} }
           Image {
               width: parent.height*0.8
               height: parent.height*0.8
               anchors.centerIn: parent
               source: "qrc:/images/newmessage.png"
           }
           MouseArea {
               id: backmouse3
               anchors.fill: parent
               anchors.margins: -10
               //onClicked: stackView.pop()
           }
       }

        // Settings Button
        Rectangle {
            id: settingsButton
            height: toolBar.height*0.8
            width: toolBar.height*0.8
            anchors.right: parent.right
            anchors.leftMargin: 5
            //opacity: stackView.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            radius: 4
            color: backmouse4.pressed ? "#ff9571" : "transparent"
            Behavior on opacity { NumberAnimation{} }
            Image {
                width: parent.height*0.8
                height: parent.height*0.8
                anchors.centerIn: parent
                source: "qrc:/images/settingsicon.png"
            }
            MouseArea {
                id: backmouse4
                anchors.fill: parent
                anchors.margins: -10
                //onClicked: stackView.pop()
            }
        }

    }

    statusBar: BorderImage {
        border.bottom: 8
        source: "qrc:/images/footerbar.png"
        width: whisperrMain.width
        height: whisperrMain.height * 0.075
    }

}

