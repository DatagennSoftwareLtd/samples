import QtQuick 2.4

NavigationDrawer {
    id: drawer

    opacity: 0.5
    //anchors.top: navigationBar.bottom
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#707070" }//"#1141a7" }
        GradientStop { position: 1.0; color: "#000000" }//"#0f1273"}
    }

    position: Qt.LeftEdge

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
                    GradientStop { position: 0.0; color: "#5e5e5e" }
                    GradientStop { position: 1.0; color:  "#000000"}
                }
                Gradient {
                    id: pressedDelegateItem
                    GradientStop { position: 0.0; color:  "#5e5e5e"}
                    GradientStop { position: 1.0; color:  "#000000"}
                }
            }
        }

    // Do Not Disturb
    Rectangle{
        id: dNDButtonRect
        width: parent.width
        height: 40
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#707070" }//"#1141a7" }
            GradientStop { position: 1.0; color: "#000000" }//"#0f1273"}
        }

        Text{
            text: "Do Not Disturb"
            id: dNDtitleTxt
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 18
            color:  "#c1c3c8"
        }

        Text{
            text: "off"
            id: dNDstatusTxt
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 18
            color:  "#c1c3c8"
        }

        MouseArea{
            width: parent.width
            height:  parent.height
            onClicked: {
                if (dNDstatusTxt.text == "on")
                {
                    dNDstatusTxt.text = "off"
                }
                else
                {
                    dNDstatusTxt.text = "on"
                }
            }
        }
    }

//------------------------------------
//PIN Lock
//------------------------------------
    ListModel {
            id: d_t_PinLockModel
            ListElement {
                settingNumber: 1
                settingName: "PIN"
                settingValue: "1234"
            }
            ListElement {
                settingNumber: 2
                settingName: "Status"
                settingValue: "On"

            }
    }
    CollapsiblePanel {
           id: panelPinLock
           width: parent.width
           height: parent.height
           anchors.top: dNDButtonRect.bottom
           titleText: "PIN Lock"
           customModel: d_t_PinLockModel
           customDelegate: myDelegate
           onItemselected:{
               console.log(index);
           }
    }

    //------------------------------------
    //Blocked Contacts
    //------------------------------------
    ListModel {
            id: d_t_BlockedContactsModel
            ListElement {
                settingNumber: 1
                settingName: "Display list"
                //settingValue: "1234"
            }
            ListElement {
                settingNumber: 2
                settingName: "Add New"
                //settingValue: "On"

            }
            ListElement {
                settingNumber: 3
                settingName: "Clear All"
                //settingValue: "On"
            }
    }
    CollapsiblePanel {
           id: panelBlockedContacts
           width: parent.width
           height: parent.height
           anchors.top: panelPinLock.bottom
           titleText: "Blocked Contacts"
           customModel: d_t_BlockedContactsModel
           customDelegate: myDelegate
           onItemselected:{
               console.log(index);
           }
    }

    //------------------------------------
    //Notifications
    //------------------------------------
    ListModel {
            id: d_t_NotificationsModel
            ListElement {
                settingNumber: 1
                settingName: "Vibrate"
                settingValue: "On"
            }
            ListElement {
                settingNumber: 2
                settingName: "Missed Calls"
                settingValue: "On"

            }
            ListElement {
                settingNumber: 3
                settingName: "Voicemail"
                settingValue: "Off"
            }
    }
    CollapsiblePanel {
           id: panelNotifications
           width: parent.width
           height: parent.height
           anchors.top: panelBlockedContacts.bottom
           titleText: "Notifications"
           customModel: d_t_NotificationsModel
           customDelegate: myDelegate
           onItemselected:{
               console.log(index);
           }
    }

    //------------------------------------
    //My Account
    //------------------------------------
    ListModel {
            id: d_t_MyAccountModel
            ListElement {
                settingNumber: 1
                settingName: "Balance Top Up"
                settingValue: ""
            }
            ListElement {
                settingNumber: 2
                settingName: "New Line"
                settingValue: ""

            }
            ListElement {
                settingNumber: 3
                settingName: "Line Settings"
                settingValue: ""
            }
    }
    CollapsiblePanel {
           id: panelMyAccount
           width: parent.width
           height: parent.height
           anchors.top: panelNotifications.bottom
           titleText: "My Account"
           customModel: d_t_MyAccountModel
           customDelegate: myDelegate
           onItemselected:{
               console.log(index);
           }
    }

    //------------------------------------
    //Invite Friends
    //------------------------------------
    ListModel {
            id: d_t_InviteFriendsModel
            ListElement {
                settingNumber: 1
                settingName: "Facebook"
                settingValue: ""
            }
            ListElement {
                settingNumber: 2
                settingName: "Email"
                settingValue: ""

            }
            ListElement {
                settingNumber: 3
                settingName: "SMS"
                settingValue: ""
            }
    }
    CollapsiblePanel {
           id: panelInviteFriends
           width: parent.width
           height: parent.height
           anchors.top: panelMyAccount.bottom
           titleText: "Invite Friends"
           customModel: d_t_InviteFriendsModel
           customDelegate: myDelegate
           onItemselected:{
               console.log(index);
           }
    }

    //------------------------------------
    //Autostart on Startup
    //------------------------------------
    Rectangle{
        id: autostartButtonRect
        width: parent.width
        height: 40
        anchors.top: panelInviteFriends.bottom
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#707070" }//"#1141a7" }
            GradientStop { position: 1.0; color: "#000000" }//"#0f1273"}
        }

        Text{
            text: "Autostart on Startup"
            id: autostartTitleTxt
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 18
            color:  "#c1c3c8"
        }

        Text{
            text: "off"
            id: autostartStatusTxt
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 18
            color:  "#c1c3c8"
        }

        MouseArea{
            width: parent.width
            height:  parent.height
            onClicked: {
                if (autostartStatusTxt.text == "on")
                {
                    autostartStatusTxt.text = "off"
                }
                else
                {
                    autostartStatusTxt.text = "on"
                }
            }
        }
    }

    //------------------------------------
    //Logout
    //------------------------------------
    Rectangle{
        id: logOutButtonRect
        width: parent.width
        height: 40
        anchors.top: autostartButtonRect.bottom
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#707070" }//"#1141a7" }
            GradientStop { position: 1.0; color: "#000000" }//"#0f1273"}
        }

        Text{
            text: "LogOut"
            id: logOutTitleTxt
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 18
            color:  "#c1c3c8"
        }

        MouseArea{
            width: parent.width
            height:  parent.height
            onClicked: {

            }
        }
    }

    // Bottom Free space
    Rectangle{
        anchors.top: logOutButtonRect.bottom
        anchors.bottom: parent.Bottom
        width: parent.width

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#707070" }//"#1141a7" }
            GradientStop { position: 1.0; color: "#000000" }//"#0f1273"}
        }
    }
}

