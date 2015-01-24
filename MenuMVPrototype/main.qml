import QtQuick 2.4
import QtQuick.Controls 1.2

import ItemType 1.0

ApplicationWindow {
    title: "Menu MV Prototype"
    id: mainWindow
    width: 320
    height: 480
    visible: true

    toolBar: ToolBar {
        id: toolBar

    }

    Component {
        id: myDelegate

        Rectangle {
            height: 30
            width: parent.width

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

                    console.log(model.type === ItemType.ItChecker);
                    if(model.type === ItemType.ItChecker)
                    {
                        console.log("Checker");

                        if(model.value === "On")
                            model.value = "Off"
                        else
                            model.value = "On"
                    }
                    else
                        console.log("Not Checker");
                }
            }
        }
    }

    ListView {
        id: view1

        anchors { top: parent.top; left: parent.left; bottom: parent.bottom }
        width: parent.width / 2
        spacing: 5

        delegate : Item {
            height: 30
            width: parent.width

            Loader {
                id: myLoader

                states: [
                    State {
                            name: "checker"; when: type === ItemType.ItChecker
                            PropertyChanges { target: myLoader; sourceComponent: my1.mycomponent }
                    },
                    State {
                            name: "edit"; when: type === ItemType.ItEdit
                            PropertyChanges { target: myLoader; sourceComponent: my2.mycomponent }
                    },
                    State {
                            name: "button"; when: type === ItemType.ItButton
                            PropertyChanges { target: myLoader; sourceComponent: my3.mycomponent }
                    }
                ]
            }

            CheckerDelegate {
                width: parent.width
                id: my1
            }
            EditDelegate {
                width: parent.width
                id: my2
            }

            ButtonDelegate {
                width: parent.width
                id: my3
            }
        }

        model: mainMenuModel.list

    }

    ListView {
        id: view2
        anchors { top: parent.top; right: parent.right; bottom: parent.bottom }
        width: parent.width / 2
        spacing: 5

        //delegate: myDelegate
        delegate : Item {
            height: 30
            width: parent.width

            Loader {
                id: myLoader2

                states: [
                    State {
                            name: "checker"; when: type === ItemType.ItChecker
                            PropertyChanges { target: myLoader2; sourceComponent: my21.mycomponent }
                    },
                    State {
                            name: "edit"; when: type === ItemType.ItEdit
                            PropertyChanges { target: myLoader2; sourceComponent: my22.mycomponent }
                    },
                    State {
                            name: "button"; when: type === ItemType.ItButton
                            PropertyChanges { target: myLoader2; sourceComponent: my23.mycomponent }
                    }
                ]
            }

            CheckerDelegate {
                width: parent.width
                id: my21
            }
            EditDelegate {
                width: parent.width
                id: my22
            }

            ButtonDelegate {
                width: parent.width
                id: my23
            }
        }

        model: mainMenuModel.list
    }

}
