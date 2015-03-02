import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 540
    minimumWidth: 300
    minimumHeight: 540

    Rectangle{
        id: accountRect
        width: parent.width
        height: 20

        Text {
            text: "account:"
            font.bold: true
            font.pointSize: 8
            height: accountRect.height
            anchors.left: accountRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: accountInput.text
            width: 180; height: accountRect.height
            anchors.right: accountRect.right
            BorderImage {
                source: "images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: accountInput
                //text: sipua.user
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    //sipua.user = text;
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: userRect
        width: parent.width
        height: 20
        anchors.top: accountRect.bottom

        Text {
            text: "user:"
            font.bold: true
            font.pointSize: 8
            height: userRect.height
            anchors.left: userRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: userInput.text
            width: 180; height: userRect.height
            anchors.right: userRect.right
            BorderImage {
                source: "images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: userInput
                //text: sipua.user
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    //sipua.user = text;
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: passwordRect
        width: parent.width
        height: 20
        anchors.top: userRect.bottom
        //color: parent.color

        Text {
            id: pswText
            text: "password:"
            font.bold: true
            font.pointSize: 8
            height: passwordRect.height
            anchors.left: passwordRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: passwordInput.text
            width: 180; height: passwordRect.height
            anchors.right: passwordRect.right
            BorderImage {
                source: "images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: passwordInput
                //text: sipua.password
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    //sipua.password = text;
                    console.log(text);
                }
            }
        }
    }

    // accounts model delegate
    Component {
       id: accountDelegate
       Item {
           width: parent.width; height: 80
           property var view: ListView.view
           property var isCurrent: ListView.isCurrentItem

           Rectangle {
               anchors.margins: 5
               anchors.fill: parent
               Column {
                   Text { text: '<b>name:</b> ' + model.name }
                   Text { text: '<b>user:</b> ' + model.user }
                   Text { text: '<b>password:</b> ' + model.password }
               }
               MouseArea {
                   anchors.fill: parent
                   onClicked: view.currentIndex = model.index
               }
           }
       }
    }

    ListView {
        id: accountView
        width: parent.width;
        height: 160
        anchors.top: passwordRect.bottom
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        highlightFollowsCurrentItem: true
        focus: true
        clip: true

        model: accountsModel.list
        delegate: accountDelegate
    }

    Rectangle {
        id: accountManagerRect
        width: parent.width
        height: 60
        anchors.top: accountView.bottom

        Button {
            id: addAccountButton
            text: "add"
            height: parent.height
            width: parent.width/3 - 5
            anchors.margins: 5

            onClicked: {
                accountsModel.addAccount(accountInput.text, userInput.text, passwordInput.text);
            }
        }

        Button {
            id: deleteAccountButton
            text: "delete"
            height: parent.height
            width: parent.width/3 - 5
            anchors.margins: 5
            anchors.left: addAccountButton.right

            onClicked: {
                ;
            }
        }
        Button {
            id: changeAccountButton
            text: "change"
            height: parent.height
            width: parent.width/3 - 5
            anchors.margins: 5
            anchors.right: parent.right

            onClicked: {
                ;
            }
        }
    }

    // buddy edit

    Rectangle{
        id: buddyRect
        width: parent.width
        height: 20
        anchors.top: accountManagerRect.bottom

        Text {
            text: "buddy:"
            font.bold: true
            font.pointSize: 8
            height: buddyRect.height
            anchors.left: buddyRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: buddyInput.text
            width: 180; height: buddyRect.height
            anchors.right: buddyRect.right
            BorderImage {
                source: "images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: buddyInput
                //text: sipua.user
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    //sipua.user = text;
                    console.log(text);
                }
            }
        }
    }

    Rectangle{
        id: uriRect
        width: parent.width
        height: 20
        anchors.top: buddyRect.bottom
        //color: parent.color

        Text {
            id: uriText
            text: "uri:"
            font.bold: true
            font.pointSize: 8
            height: uriRect.height
            anchors.left: uriRect.left
            anchors.margins: 5
        }

        Item {
            property alias text: uriInput.text
            width: 180; height: uriRect.height
            anchors.right: uriRect.right
            BorderImage {
                source: "images/lineedit.sci"
                anchors.fill: parent
            }
            TextInput {
                id: uriInput
                //text: sipua.password
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                    //sipua.password = text;
                    console.log(text);
                }
            }
        }
    }

    // contacts model delegate
    Component {
       id: contactDelegate
       Item {
           width: parent.width; height: 80
           property var view: ListView.view
           property var isCurrent: ListView.isCurrentItem

           Rectangle {
               anchors.margins: 5
               anchors.fill: parent
               Column {
                   Text { text: '<b>buddy:</b> ' + model.name }
                   Text { text: '<b>uri:</b> ' + model.uri }
               }
               MouseArea {
                   anchors.fill: parent
                   onClicked: view.currentIndex = model.index
               }
           }
       }
    }

    ListView {
        id: contactView
        width: parent.width;
        height: 160
        anchors.top: uriRect.bottom
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        highlightFollowsCurrentItem: true
        focus: true
        clip: true

        model: contactsModel.list
        delegate: contactDelegate
    }

    Rectangle {
        id: contactManagerRect
        width: parent.width
        height: 60
        anchors.top: contactView.bottom

        Button {
            id: addContactButton
            text: "add"
            height: parent.height
            width: parent.width/3 - 5
            anchors.margins: 5

            onClicked: {
                contactsModel.addContact(buddyInput.text, uriInput.text);
            }
        }

        Button {
            id: deleteContactButton
            text: "delete"
            height: parent.height
            width: parent.width/3 - 5
            anchors.margins: 5
            anchors.left: addContactButton.right

            onClicked: {
                ;
            }
        }
        Button {
            id: changeContactButton
            text: "change"
            height: parent.height
            width: parent.width/3 - 5
            anchors.margins: 5
            anchors.right: parent.right

            onClicked: {
                ;
            }
        }
    }

    /*

    Rectangle{
        id: buttonsRect
        width: parent.width
        height: 50
        anchors.top: parent.top
        //anchors.margins: 5

        Button {
            id: createDbButton
            text: "create"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: buttonsRect.left
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                dbProvider.create();
            }
        }

        Button {
            id: openDbButton
            text: "open"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: createDbButton.right
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                dbProvider.open();
            }
        }

        Button {
            id: closeDbButton
            text: "close"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: openDbButton.right
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                dbProvider.close();
            }
        }

        Button {
            id: removeDbButton
            text: "remove"
            height: buttonsRect.height - 10
            width: parent.width/4 - 10
            anchors.left: closeDbButton.right
            anchors.margins: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                dbProvider.remove();
            }
        }
    }
*/
}
