import QtQuick 2.4
import QtQuick.Controls 1.3
import QtMultimedia 5.4

Item{
    id: main
    anchors.fill: parent

    signal message(string msg)

    Menu {
        id: popupMenu

        MenuItem {
            text: "debug mode off"
            onTriggered:{
                //vibration.setVibration(300);
                text = (text === "debug mode off")? "debug mode on" : "debug mode off";
                iruRect.visible = (text === "debug mode off")? true : false;
                iruRect.visible = (text === "debug mode off")? z = 100 : z = 0;
                mainAppLoaderItem.statusBar.visible = (text === "debug mode off")? true : false;

                /*
                if(text === "debug mode off")
                {
                    loader.anchors.top =  iruRect.bottom;
                    loader.anchors.bottom = parent.bottom;
                }
                else
                {
                    loader.anchors.top =  main.bottom;
                }
                */
            }

        }
    }


    Keys.onReleased:{
        //if (event.key === Qt.Key_Back) {
        //    event.accepted = true;
        //}
        if (event.key === Qt.Key_Menu)
        {
            console.log("popup");
            popupMenu.popup();
            event.accepted = true;
        }

        console.log(event.key);
    }

    Rectangle{
        id: iruRect
        width: parent.width
        height: 50
        z:100
        Item {
            id: iruItem
            property alias text: gmlUri.text
            width: 180; height: iruRect.height
            anchors.left: iruRect.left
            anchors.right: loadButton.left

            BorderImage {
                source: "qrc:/images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: gmlUri
                color: "#151515"; selectionColor: "green"
                font.pixelSize:18; font.bold: true
                width: parent.width-16
                height: iruRect.height
                anchors.centerIn: parent
                verticalAlignment: TextInput.AlignVCenter
                //focus: true
                //text: "http://rolen.whisperr.com:8061/march//.qml"
                text: "http://rolen.whisperr.com:8061/march/CS/main.qml"

                //text: "http://vlad.whisperr.com:8061/test/vibrationtest.qml"
                //text: "http://vlad.whisperr.com:8061/march/CS/main.qml"
            }
        }


        Button {
            id: loadButton
            text: "Go"
            anchors.right: iruRect.right
            height: iruRect.height
            onClicked:
            {
                Qt.inputMethod.commit();
                Qt.inputMethod.hide();
                // load .qml
                loader.setSource("");
                componentCache.clear();
                //loader.source = iruItem.text; //gmlUri.text
                loader.setSource(iruItem.text);
                console.log(iruItem.text);
            }
        }
    }

    Loader {
        id: loader
        anchors.fill: parent
        //anchors.top: iruRect.bottom
        //anchors.bottom: parent.bottom
        width: parent.width

        onStatusChanged: {
            if (loader.status == Loader.Null) main.message("Inactive")
            else if (loader.status == Loader.Ready) main.message("Ready")
            else if (loader.status == Loader.Loading) main.message("Loading")
            else if (loader.status == Loader.Error){
                // try load again
                loader.source = "";
                loader.setSource(iruItem.text);
                console.log("reload: " + loader.source);
                main.message("an error occurred while loading the QML");
            }
        }
        onLoaded:
        {
            console.log("loaded: " + loader.source);
        }

        Connections {
            target: loader.item
            onMessage: main.message(msg);
        }
    }

    Component.onCompleted: {
            main.forceActiveFocus()
    }
}
