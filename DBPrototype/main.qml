import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

ApplicationWindow {
    visible: true
    width: 300
    height: 540
    minimumWidth: 300
    minimumHeight: 540

    // account editor
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
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
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
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                }
            }
        }
    }

    Rectangle{
        id: passwordRect
        width: parent.width
        height: 20
        anchors.top: userRect.bottom

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
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
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
           property variant account: model

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
                   onClicked: {
                       view.currentIndex = model.index;
                       contactsModel.updateModel(model.name);
                   }
               }
           }
       }
    }

    // account view
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

    // account manager buttons
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
                dbProvider.addAccount(accountInput.text, "sip.whisperr.com",
                                      userInput.text, passwordInput.text);
                console.log("add account");
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
                // take selected item
                dbProvider.deleteAccount(accountView.currentItem.account.name, "sip.whisperr.com",
                                      accountView.currentItem.account.user,
                                      accountView.currentItem.account.password);
                console.log("delete account");
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
                // take selected item
                dbProvider.changeAccount(accountView.currentItem.account.name, "sip.whisperr.com",
                                      accountView.currentItem.account.user,
                                      accountView.currentItem.account.password,
                                      accountInput.text, "sip.whisperr.com",
                                      userInput.text, passwordInput.text);

                console.log("change account");
            }
        }
    }

    // buddy editor
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
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
                }
            }
        }
    }

    Rectangle{
        id: uriRect
        width: parent.width
        height: 20
        anchors.top: buddyRect.bottom

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
                color: "#151515"; selectionColor: "green"
                font.pixelSize:8; font.bold: true
                width: parent.width-16
                anchors.centerIn: parent
                focus: true
                onEditingFinished: {
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
           property variant contact: model

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

    // contacts view
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

    // contacts manager buttons
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
                //contactsModel.addContact(buddyInput.text, uriInput.text);
                dbProvider.addContact(accountView.currentItem.account.name,
                                      buddyInput.text, uriInput.text);
                console.log("add contact");
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
                dbProvider.deleteContact(accountView.currentItem.account.name,
                                         contactView.currentItem.contact.name,
                                         contactView.currentItem.contact.uri);
                console.log("delete contact");
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
                dbProvider.changeContact(accountView.currentItem.account.name,
                                         contactView.currentItem.contact.name,
                                         contactView.currentItem.contact.uri,
                                         buddyInput.text, uriInput.text);
                console.log("change contact");
            }
        }
    }

}
