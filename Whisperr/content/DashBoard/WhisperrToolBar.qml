import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

import "../CustomItems"

BorderImage {
    id: toolBar
    border.bottom: 8
    source: "qrc:/images/toolbar/toolbar.png"

    signal backButtonClicked()
    signal searchButtonClicked()
    signal newmessageButtonClicked()
    signal settingsButtonClicked()

    readonly property real btnSz: toolBar.height*0.8

    WhisperrToolButton{
        id: menuButton
        height: btnSz; width: btnSz
        anchors.left: parent.left
        anchors.leftMargin: 5
        iconSource: "qrc:/images/toolbar/menu.png"
    }

    WhisperrToolButton{
        id: backButton
        height: btnSz; width: btnSz
        anchors.left: menuButton.right
        anchors.leftMargin: 5
        opacity: stackView.depth > 2 ? 1 : 0
        enabled: stackView.depth > 2 ? 1 : 0
        iconSource: "qrc:/images/toolbar/navigation_previous_item.png"
        Connections {
            target: backButton
            onClicked: toolBar.backButtonClicked()
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

    WhisperrToolButton {
        id: searchButton
        height: btnSz; width: btnSz
        anchors.right: newmessageButton.left
        anchors.leftMargin: 5
        iconSource: "qrc:/images/toolbar/searchicon.png"
        Connections {
            target: searchButton
            onClicked: toolBar.searchButtonClicked()
        }
    }

    WhisperrToolButton {
        id: newmessageButton
        height: btnSz; width: btnSz
        anchors.right: settingsButton.left
        anchors.leftMargin: 5
        iconSource: "qrc:/images/toolbar/newmessage.png"
        Connections {
            target: newmessageButton
            onClicked: toolBar.newmessageButtonClicked()
        }
    }

    WhisperrToolButton {
        id: settingsButton
        height: btnSz; width: btnSz
        anchors.right: parent.right
        anchors.leftMargin: 5
        iconSource: "qrc:/images/toolbar/settingsicon.png"
        Connections {
            target: settingsButton
            onClicked: toolBar.settingsButtonClicked()
        }
    }
}
