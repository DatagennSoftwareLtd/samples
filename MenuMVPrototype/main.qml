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
        property bool isItem: false

        anchors { top: parent.top; left: parent.left; bottom: parent.bottom }
        width: parent.width / 2
        spacing: 5

        //delegate : model.type !== ItemType.ItChecker ? myEditDelegate : myCheckerDelegate
        //delegate : myEditDelegate

        delegate : Component {
            id: delegateComponent
            Loader {
                id: delegateLoader
                property string name: model.name
                property string value: model.value
                property int type: model.type

                onLoaded: {
                    console.log(model.type);
                    console.log(ItemType.ItChecker);
                    //sourceComponent = myEditDelegate;//myCheckerDelegate;
                }
               //source : (model.type === ItemType.ItChecker) ? "http://localhost/CheckerDelegate.qml" : "http://localhost/EditDelegate.qml"
               sourceComponent: (model.type === ItemType.ItChecker) ? myCheckerDelegate : myEditDelegate

            }
            /*
            Connections {
                target: delegateLoader.item
                onMessage: {
                    console.log(msg)
                }

            }
            */

        }

        model: mainMenuModel.list

        Component /* Item*/{
            id: myCheckerDelegate
            //property string delegateName: "CheckerDelegate"
            //signal message(string msg)

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
                                value = "On";

                            //myCheckerDelegate.message(value);
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
                        //model.value = text
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

    TextInput {
        text: "value777777777777777777"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true
        font.pixelSize: 14
    }
}
