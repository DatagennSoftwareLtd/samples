import QtQuick 2.4
import QtQuick.Controls 1.3

ApplicationWindow {
    title: qsTr("Collapsible Panel")
    id: mainWindow
    width: 320
    height: 480
    visible: true

    Rectangle{
        id: titleBar
        width: parent.width
        height: 50
        color: "skyblue"
        Text{
            anchors.centerIn: parent
            text: "Collapsible Panels Demo"
            color: "darkblue"
        }
    }

    ListModel {
        id: d_t_SettingsModel
        ListElement {
            settingNumber: 1
            settingName: "Time"
            settingValue: "18:03"
        }
        ListElement {
            settingNumber: 2
            settingName: "Time zone"
            settingValue: "GMT +5:30 Mumbai"
        }
        ListElement {
            settingNumber: 3
            settingName: "Date"
            settingValue: "28 February"
        }
        ListElement {
            settingNumber: 4
            settingName: "Date format"
            settingValue: "dd mm yy"
        }
        ListElement {
            settingNumber: 5
            settingName: "Time format"
            settingValue: "24 hour"
        }
        ListElement {
            settingNumber: 6
            settingName: "Clock type"
            settingValue: "Analogue"
        }
    }

    ListModel {
        id: callSettingsModel
        ListElement {
            settingNumber: 1
            settingName: "Send my caller ID"
            settingValue: "No"
        }
        ListElement {
            settingNumber: 2
            settingName: "Call Waiting"
            settingValue: "On"
        }
        ListElement {
            settingNumber: 3
            settingName: "Video in call"
            settingValue: "Ask first"
        }
        ListElement {
            settingNumber: 4
            settingName: "Show call duration"
            settingValue: "Yes"
        }
        ListElement {
            settingNumber: 5
            settingName: "Show call summary"
            settingValue: "Yes"
        }
        ListElement {
            settingNumber: 6
            settingName: "Active profile"
            settingValue: "General"
        }
    }

    ListModel {
        id: displaySettingsModel
        ListElement {
            settingNumber: 1
            settingName: "Light Sensor"
            settingValue: "20%"
        }
        ListElement {
            settingNumber: 2
            settingName: "Font Size"
            settingValue: "Normal"
        }
        ListElement {
            settingNumber: 3
            settingName: "Screen/keylock time-out"
            settingValue: "1 minute"
        }
        ListElement {
            settingNumber: 4
            settingName: "Welcome note/logo"
            settingValue: "Default"
        }
        ListElement {
            settingNumber: 5
            settingName: "Light time-out"
            settingValue: "5 seconds"
        }
    }

    Component
    {
        id: myDelegate
        Rectangle{
            id: myDelegateItem
            width: parent.width
            height:  30
            gradient:unpressedDelegateItem
            MouseArea{
                anchors.fill:  parent
                onPressed: {
                    myDelegateItem.gradient = pressedDelegateItem
                    border.width = 2
                    border.color = "yellow"
                    statusBar.text = settingName + " Clicked"
                    myRect.itemselected(index)
                }
                onReleased: {
                    border.width = 0
                    statusBar.text= "Item selection triggers a signal too!"
                    myDelegateItem.gradient = unpressedDelegateItem
                }
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                text: settingName
                color: "#c1c3c8"
                font.bold: true
                font.pixelSize: 14
            }
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                text: settingValue
                color: "#c1c3c8"
                font.bold: true
                font.pixelSize: 14
            }
            Gradient {
                id: unpressedDelegateItem
                GradientStop { position: 0.0; color: "#1753ce" }
                GradientStop { position: 1.0; color:  "#15159c"}
            }
            Gradient {
                id: pressedDelegateItem
                GradientStop { position: 0.0; color:  "#15159c"}
                GradientStop { position: 1.0; color:  "#1753ce"}
            }
        }
    }

    CollapsiblePanel
    {
        id: panel1
        width: parent.width
        height: parent.height
        anchors.top: titleBar.bottom
        titleText: "Date & Time Settings"
        customModel: d_t_SettingsModel
        customDelegate: myDelegate
        onItemselected:{
            console.log(index)
        }

    }
    CollapsiblePanel
    {
        id: panel2
        width: parent.width
        height: parent.height
        anchors.top: panel1.bottom
        titleText: "Call Settings"
        customModel: callSettingsModel
        customDelegate: myDelegate
        onItemselected:{
            console.log(index)
        }

    }
    CollapsiblePanel
    {
        id: panel3
        width: parent.width
        height: parent.height
        anchors.top: panel2.bottom
        titleText: "Display Settings"
        customModel: displaySettingsModel
        customDelegate: myDelegate
        onItemselected:{
            console.log(index)
        }

    }

    Rectangle{
        id: statusBar
        width: parent.width
        height: 50
        anchors.bottom: parent.bottom
        color: "skyblue"

        property alias text: statusText.text

        Text{
            id: statusText
            anchors.centerIn: parent
            color: "darkblue"
            text: "Item selection triggers a signal too!"
        }
    }

}
