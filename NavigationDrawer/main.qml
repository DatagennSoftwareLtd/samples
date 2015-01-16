import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.2

import QtQuick.Controls 1.2
import QtWebKit 3.0
//import "NavigationDrawer.qml" as MyModule

ApplicationWindow {
    title: "Navigation Drawer"
    id: mainWindow
    width: 320
    height: 480
    visible: true
/*
    Rectangle {
        x: 10
        y: 10
        width: parent.width
        height: parent.height
        color: "red"
        id: stackView
*/

        NavigationDrawer {
            id: drawer

            opacity: 0.5
            //anchors.top: navigationBar.bottom
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            position: Qt.LeftEdge
            //visualParent: stackView
            //visualParent: mainWindow

            Column{
                opacity: 0.5//parent.opacity
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right

                Button {
                    text: "Item 1"
                    id: button1
                    opacity: parent.opacity
                    height: parent.height/5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 25
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                }
                Button {
                    text: "Item 2"
                    height: parent.height/5
                    opacity: parent.opacity
                    anchors.left: parent.left
                    anchors.right: parent.right

                    style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 25
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                }
                Button {
                    text: "Item 3"
                    height: parent.height/5
                    opacity: parent.opacity
                    anchors.left: parent.left
                    anchors.right: parent.right
                    style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 25
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                }
                Button {
                    text: "Item 4"
                    height: parent.height/5
                    opacity: parent.opacity
                    anchors.left: parent.left
                    anchors.right: parent.right
                    style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 25
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                }
                Button {
                    text: "Item 5"
                    height: 75//parent.height/5
                    opacity: parent.opacity
                    anchors.left: parent.left
                    anchors.right: parent.right
                    style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 25
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                }

                ExclusiveGroup { id: tabPositionGroup }
                RadioButton {
                    id: topButton
                    text: qsTr("Top")
                    checked: true
                    exclusiveGroup: tabPositionGroup
                    //Layout.minimumWidth: 100
                }
                RadioButton {
                    id: bottomButton
                    text: qsTr("Bottom")
                    exclusiveGroup: tabPositionGroup
                    //Layout.minimumWidth: 100
                }

                Menu {
                     id: mainMenu
                     // define the items in the menu and corresponding actions
                     //content: MenuLayout {
                         MenuItem {
                             text: "Red"
                             //onClicked: rect.color = "Red"
                         }

                     //}
                 }
            }



          //  YourContentItem {
            //    ....
            //}
        }
    //}




    Image {
       id: bubble
       source: "content/Bluebubble.svg"
       smooth: true
       property real centerX: mainWindow.width / 2
       property real centerY: mainWindow.height / 2
       property real bubbleCenter: bubble.width / 2
       x: centerX - bubbleCenter
       y: centerY - bubbleCenter
       Behavior on y {
           SmoothedAnimation {
               easing.type: Easing.Linear
               duration: 100
           }
       }

       Behavior on x {
           SmoothedAnimation {
               easing.type: Easing.Linear
               duration: 100
           }
       }
   }

}
