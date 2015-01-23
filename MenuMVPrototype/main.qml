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
                sourceComponent: (type === ItemType.ItChecker ) ? my1 : my2

            }

            CheckerDelegate {
                //width: parent.width
                id: my1
            }
            EditDelegate {
                //width: parent.width
                id: my2
            }
        }

        model: mainMenuModel.list

        Component {
            id: myCheckerDelegate

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

                        console.log("Checker:");

                        if(type === ItemType.ItChecker)
                        {
                            if(value === "On")
                                value = "Off"
                            else
                                value = "On";
                        }
                        else
                            ;//console.log("Not Checker");
                    }
                }
            }
        }

        Component {
            id: myEditDelegate
            //property string delegateName: "EditDelegate"

            Rectangle {
                height: 30
                width: view1.width

                Text {
                    id: t1
                    text: name
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pixelSize: 14
                }

                TextInput {
                    text: value
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pixelSize: 14
                    onEditingFinished: {
                        value = text
                        console.log(text);
                    }
                }
            }
        }
    }

    ListView {
        id: view2
        anchors { top: parent.top; right: parent.right; bottom: parent.bottom }
        width: parent.width / 2
        spacing: 5

        delegate: myDelegate
        model: mainMenuModel.list
    }

}
