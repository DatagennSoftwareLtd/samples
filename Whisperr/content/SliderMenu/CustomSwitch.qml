import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

NavigationDrawer{

     color: "#5d5d5d"
     //visualParent:
     position: Qt.LeftEdge;
Flickable {

    id: scrollslide
    //anchors.fill: drawer.item
    anchors.fill: parent

    property int itemHeight: 20
    property int wHeight: 20
    property int wWidth: 20

    property Item visualParent: parent
    width: parent.width
    height: parent.height

    contentHeight: parent.height + ( parent.height * 0.005 )
    flickableDirection: Flickable.VerticalFlick
    //////////// DO NOT DISTURB ////////////
    Rectangle {
        id: dndbody
        color: "#5d5d5d"
        width: parent.width
        height: itemHeight*1.1
        Image {
            id: dndicon
            anchors.left: dndbody.left
            anchors.leftMargin: dndbody.width * 0.04
            anchors.top: dndbody.top
            anchors.topMargin: dndbody.height * 0.3
            width: dnd.height
            height: dnd.height
            source: "qrc:/images/menuIcons/dndicon.png"
        }

        Text {
            id: dnd
            anchors.left: dndicon.right
            anchors.leftMargin: parent.width * 0.04
            anchors.top: dndbody.top
            anchors.topMargin: dndbody.height * 0.3
            text: "Do Not Disturb"
            font.pixelSize: itemHeight * 0.40
            color: "#fff"
        }

        Switch {
            style: SwitchStyle {
                groove: Rectangle {
                    implicitWidth: dnd.height * 3
                    implicitHeight: dnd.height
                    radius: 8
                    color: "#00000000"
                    Rectangle {
                        implicitWidth: dnd.height * 1.7
                        implicitHeight: dnd.height
                        radius: 8
                        color: "#ff622e"
                        border.width: 1
                        border.color: "#ebebeb"
                        anchors.left: parent.left
                    }
                    Rectangle {
                        implicitWidth: dnd.height * 1.7
                        implicitHeight: dnd.height
                        radius: 8
                        color: "#bbbbbb"
                        border.width: 1
                        border.color: "#ebebeb"
                        anchors.right: parent.right
                    }
                }
                handle: Rectangle {
                    implicitWidth: dnd.height * 1.7
                    implicitHeight: dnd.height
                    radius: 8
                    color: "#ebebeb"
                }
            }

            id: dndswitch
            checked: true
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.04
            anchors.top: dndbody.top
            anchors.topMargin: dndbody.height * 0.3
        }

        MouseArea {
            //propagateComposedEvents: true
            preventStealing: true
            anchors.fill: parent
            onClicked: {
                if ( dndswitch.checked == true ) {
                    dndswitch.checked = false;
                    console.log("Do Not Disturb is OFF");
                }
                else {
                    dndswitch.checked = true;
                    console.log("Do Not Disturb is ON");
                }
                //mouse.accepted = false;
            }
        }
    }

    Rectangle {
        id: separator1; color: "#000"; height: 1;
        anchors.top: dndbody.bottom; anchors.left: parent.left; width: parent.width
    }

    //////////// PIN LOCK ////////////
    Rectangle {
        id: plbody
        color: "#5d5d5d"
        width: parent.width
        height: itemHeight//toolBar.height + (toolBar.height * 0.1)
        anchors.top: separator1.bottom

        Image {
            id: plicon
            anchors.left: plbody.left
            anchors.leftMargin: plbody.width * 0.04
            anchors.top: plbody.top
            anchors.topMargin: plbody.height * 0.3
            width: pinlock.height
            height: pinlock.height
            source: "images/plicon.png"
        }

        Text {
            id: pinlock
            anchors.left: plicon.right
            anchors.leftMargin: plbody.width * 0.04
            anchors.top: plbody.top
            anchors.topMargin: plbody.height * 0.3
            text: "Pin Lock"
            font.pixelSize: toolBar.height * 0.40
            color: "#fff"
        }

        Image {
            id: pltriangle
            anchors.right: plbody.right
            anchors.rightMargin: plbody.width * 0.04
            anchors.top: plbody.top
            anchors.topMargin: plbody.height * 0.3
            width: pinlock.height
            height: pinlock.height
            source: "images/triangle.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (dropdown.visible == false) {
                    dropdown.visible = true
                    plbody.color = "#fd6500"
                    hiddenplbodyseparator.visible = true
                    separator2.anchors.top = dropdown.bottom
                    separator2.anchors.topMargin = 0
                    //scrollslide.contentHeight = ( dropdown.height / 2 ) + drawer.height + ( drawer.height * 0.005 )
                    scrollslide.contentHeight = ( dropdown.height / 2 ) + parent.height + ( parent.height * 0.005 )
                    pltriangle.rotation = 180

                    if (bcdropdown.visible == true) {
                        bcdropdown.visible = false
                        bcbody.color = "#5d5d5d"
                        hiddenbcbodyseparator.visible = false
                        separator3.anchors.top = bcbody.bottom
                        bctriangle.rotation = 0
                    }

                    if (ndropdown.visible == true ) {
                        ndropdown.visible = false
                        nbody.color = "#5d5d5d"
                        hiddennbodyseparator.visible = false
                        separator4.anchors.top = nbody.bottom
                        ntriangle.rotation = 0
                    }

                    if (madropdown.visible == true){
                        madropdown.visible = false
                        mabody.color = "#5d5d5d"
                        hiddenmabodyseparator.visible = false
                        separator5.anchors.top = mabody.bottom
                        matriangle.rotation = 0
                    }

                    if (infdropdown.visible == true){
                        infdropdown.visible = false
                        infbody.color = "#5d5d5d"
                        hiddenmabodyseparator.visible = false
                        separator6.anchors.top = infbody.bottom
                        inftriangle.rotation = 0
                    }

                } else {
                    dropdown.visible = false
                    plbody.color = "#5d5d5d"
                    hiddenplbodyseparator.visible = false
                    separator2.anchors.top = plbody.bottom
                    scrollslide.contentHeight = drawer.height + ( drawer.height * 0.005 )
                    //scrollslide.contentHeight = panel.height + ( panel.height * 0.005 )
                    pltriangle.rotation = 0
                }
            }
        }
        }

        Rectangle {
            id: separator2
            color: "#000"
            height: 1
            anchors.top: plbody.bottom
            anchors.left: parent.left
            width: parent.width
        }

        Rectangle {
            id: hiddenplbodyseparator
            color: "#000"
            height: 1
            anchors.top: plbody.bottom
            anchors.left: parent.left
            width: parent.width
            visible: false
        }


            //////////// SUBLEVEL: PIN NUMBER AND PIN STATUS ////////////
            Rectangle {
                id: dropdown
                color: "#ff9e5e"
                visible: false
                height: ( toolBar.height * 2 ) + ( toolBar.height * 0.2 ) + 1
                width: parent.width
                anchors.top: hiddenplbodyseparator.bottom


                    //////////// PIN NUMBER ////////////
                    Rectangle {
                        id: pnbody
                        color: "#00000000"
                        width: parent.width
                        height: toolBar.height + (toolBar.height * 0.1)

                        Image {
                            id: pnicon
                            anchors.left: pnbody.left
                            anchors.leftMargin: pnbody.width * 0.13
                            anchors.top: pnbody.top
                            anchors.topMargin: pnbody.height * 0.3
                            width: pn.height
                            height: pn.height
                            source: "images/plpn.png"
                        }

                        Text {
                            id: pn
                            anchors.left: pnicon.right
                            anchors.leftMargin: pnbody.width * 0.04
                            anchors.top: pnbody.top
                            anchors.topMargin: pnbody.height * 0.3
                            text: "PIN Number"
                            font.pixelSize: toolBar.height * 0.40
                            color: "#fff"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: console.log("Pin Number Clicked!")
                        }
                    }

                    Rectangle {
                        id: pnandpsseparator
                        color: "#000"
                        height: 1
                        anchors.top: pnbody.bottom
                        anchors.left: parent.left
                        width: parent.width
                    }

                    //////////// STATUS ////////////
                    Rectangle {
                        id: psbody
                        color: "#00000000"
                        anchors.top: pnandpsseparator.bottom
                        width: parent.width
                        height: toolBar.height + (toolBar.height * 0.1)

                        Image {
                            id: psicon
                            anchors.left: psbody.left
                            anchors.leftMargin: psbody.width * 0.13
                            anchors.top: psbody.top
                            anchors.topMargin: psbody.height * 0.3
                            width: dnd.height
                            height: dnd.height
                            source: "images/pls.png"
                        }

                        Text {
                            id: ps
                            anchors.left: psicon.right
                            anchors.leftMargin: psbody.width * 0.04
                            anchors.top: psbody.top
                            anchors.topMargin: psbody.height * 0.3
                            text: "Status"
                            font.pixelSize: toolBar.height * 0.40
                            color: "#fff"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: console.log("Status Clicked!")
                        }
                    }

            }

    //////////// BLOCKED CONTACTS ////////////
    Rectangle {
        id: bcbody
        color: "#5d5d5d"
        width: parent.width
        height: toolBar.height + (toolBar.height * 0.1)
        anchors.top: separator2.bottom
            Image {
                id: bcicon
                anchors.left: bcbody.left
                anchors.leftMargin: bcbody.width * 0.04
                anchors.top: bcbody.top
                anchors.topMargin: bcbody.height * 0.3
                width: bc.height
                height: bc.height
                source: "images/bcicon.png"
            }

            Text {
                id: bc
                anchors.left: bcicon.right
                anchors.leftMargin: bcbody.width * 0.04
                anchors.top: bcbody.top
                anchors.topMargin: bcbody.height * 0.3
                text: "Blocked Contacts"
                font.pixelSize: toolBar.height * 0.40
                color: "#fff"
            }

            Image {
                id: bctriangle
                anchors.right: bcbody.right
                anchors.rightMargin: bcbody.width * 0.04
                anchors.top: bcbody.top
                anchors.topMargin: bcbody.height * 0.3
                width: bc.height
                height: bc.height
                source: "images/triangle.png"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (bcdropdown.visible == false) {
                        bcdropdown.visible = true
                        bcbody.color = "#fd6500"
                        hiddenbcbodyseparator.visible = true
                        separator3.anchors.top = bcdropdown.bottom
                        separator3.anchors.topMargin = 0
                        //scrollslide.contentHeight = ( bcdropdown.height * 0.70 )  + drawer.height + ( drawer.height * 0.005 )
                        scrollslide.contentHeight = ( bcdropdown.height * 0.70 )  + panel.height + ( panel.height * 0.005 )
                        bctriangle.rotation = 180

                        if (dropdown.visible == true) {
                            dropdown.visible = false
                            plbody.color = "#5d5d5d"
                            hiddenplbodyseparator.visible = false
                            separator2.anchors.top = plbody.bottom
                            pltriangle.rotation = 0
                        }
                        if (ndropdown.visible == true ) {
                            ndropdown.visible = false
                            nbody.color = "#5d5d5d"
                            hiddennbodyseparator.visible = false
                            separator4.anchors.top = nbody.bottom
                            ntriangle.rotation = 0
                        }

                        if (madropdown.visible == true){
                            madropdown.visible = false
                            mabody.color = "#5d5d5d"
                            hiddenmabodyseparator.visible = false
                            separator5.anchors.top = mabody.bottom
                            matriangle.rotation = 0
                        }

                        if (infdropdown.visible == true){
                            infdropdown.visible = false
                            infbody.color = "#5d5d5d"
                            hiddenmabodyseparator.visible = false
                            separator6.anchors.top = infbody.bottom
                            inftriangle.rotation = 0
                        }

                    } else {
                        bcdropdown.visible = false
                        bcbody.color = "#5d5d5d"
                        hiddenbcbodyseparator.visible = false
                        separator3.anchors.top = bcbody.bottom
                        //scrollslide.contentHeight = drawer.height + ( drawer.height * 0.005 )
                        scrollslide.contentHeight = panel.height + ( panel.height * 0.005 )
                        bctriangle.rotation = 0
                            }
                        }
                    }

    }

    Rectangle {
        id: hiddenbcbodyseparator
        color: "#000"
        height: 1
        anchors.top: bcbody.bottom
        anchors.left: parent.left
        width: parent.width
        visible: false
    }

    //////////// SUBLEVEL: DISPLAY LIST, ADD NEW AND CLEAR ALL ////////////
    Rectangle {
        id: bcdropdown
        color: "#ff9e5e"
        visible: false
        height: ( toolBar.height * 3 ) + ( toolBar.height * 0.3 ) + 2
        width: parent.width
        anchors.top: hiddenbcbodyseparator.bottom


            //////////// DISPLAY LIST ////////////
            Rectangle {
                id: dlbody
                color: "#00000000"
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: dlicon
                    anchors.left: dlbody.left
                    anchors.leftMargin: dlbody.width * 0.13
                    anchors.top: dlbody.top
                    anchors.topMargin: dlbody.height * 0.3
                    width: dl.height
                    height: dl.height
                    source: "images/bcd.png"
                }

                Text {
                    id: dl
                    anchors.left: dlicon.right
                    anchors.leftMargin: dlbody.width * 0.04
                    anchors.top: dlbody.top
                    anchors.topMargin: dlbody.height * 0.3
                    text: "Display List of Contacts"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Display List of Contacts Clicked!")
                }
            }

            Rectangle {
                id: dlandanseparator
                color: "#000"
                height: 1
                anchors.top: dlbody.bottom
                anchors.left: parent.left
                width: parent.width
            }

            //////////// ADD NEW ////////////
            Rectangle {
                id: anbody
                color: "#00000000"
                anchors.top: dlandanseparator.bottom
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: anicon
                    anchors.left: anbody.left
                    anchors.leftMargin: anbody.width * 0.13
                    anchors.top: anbody.top
                    anchors.topMargin: anbody.height * 0.3
                    width: an.height
                    height: an.height
                    source: "images/bcan.png"
                }

                Text {
                    id: an
                    anchors.left: anicon.right
                    anchors.leftMargin: anbody.width * 0.04
                    anchors.top: anbody.top
                    anchors.topMargin: anbody.height * 0.3
                    text: "Add New"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Add New Clicked!")
                }
            }

            Rectangle {
                id: anandcaseparator
                color: "#000"
                height: 1
                anchors.top: anbody.bottom
                anchors.left: parent.left
                width: parent.width
            }

            //////////// CLEAR ALL ////////////
            Rectangle {
                id: cabody
                color: "#00000000"
                anchors.top: anandcaseparator.bottom
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: caicon
                    anchors.left: cabody.left
                    anchors.leftMargin: cabody.width * 0.13
                    anchors.top: cabody.top
                    anchors.topMargin: cabody.height * 0.3
                    width: ca.height
                    height: ca.height
                    source: "images/bcca.png"
                }

                Text {
                    id: ca
                    anchors.left: caicon.right
                    anchors.leftMargin: cabody.width * 0.04
                    anchors.top: cabody.top
                    anchors.topMargin: cabody.height * 0.3
                    text: "Clear All"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Clear All Clicked!")
                }
            }

    }

    Rectangle {
        id: separator3
        color: "#000"
        height: 1
        anchors.top: bcbody.bottom
        anchors.left: parent.left
        width: parent.width
    }

    //////////// NOTIFICATIONS ////////////
    Rectangle {
        id: nbody
        color: "#5d5d5d"
        width: parent.width
        height: toolBar.height + (toolBar.height * 0.1)
        anchors.top: separator3.bottom
        Image {
            id: nicon
            anchors.left: nbody.left
            anchors.leftMargin: nbody.width * 0.04
            anchors.top: nbody.top
            anchors.topMargin: nbody.height * 0.3
            width: notif.height
            height: notif.height
            source: "images/nicon.png"
        }

        Text {
            id: notif
            anchors.left: nicon.right
            anchors.leftMargin: nbody.width * 0.04
            anchors.top: nbody.top
            anchors.topMargin: nbody.height * 0.3
            text: "Notifications"
            font.pixelSize: toolBar.height * 0.40
            color: "#fff"
        }

        Image {
            id: ntriangle
            anchors.right: nbody.right
            anchors.rightMargin: nbody.width * 0.04
            anchors.top: nbody.top
            anchors.topMargin: nbody.height * 0.3
            width: notif.height
            height: notif.height
            source: "images/triangle.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (ndropdown.visible == false) {
                    ndropdown.visible = true
                    nbody.color = "#fd6500"
                    hiddennbodyseparator.visible = true
                    separator4.anchors.top = ndropdown.bottom
                    separator4.anchors.topMargin = 0
                    //scrollslide.contentHeight = ( ndropdown.height * 0.70 )  + drawer.height + ( drawer.height * 0.005 )
                    scrollslide.contentHeight = ( ndropdown.height * 0.70 )  + panel.height + ( panel.height * 0.005 )
                    ntriangle.rotation = 180
                    if (bcdropdown.visible == true) {
                        bcdropdown.visible = false
                        bcbody.color = "#5d5d5d"
                        hiddenbcbodyseparator.visible = false
                        separator3.anchors.top = bcbody.bottom
                        bctriangle.rotation = 0
                    }

                    if (dropdown.visible == true ) {
                        dropdown.visible = false
                        plbody.color = "#5d5d5d"
                        hiddenplbodyseparator.visible = false
                        separator2.anchors.top = plbody.bottom
                        pltriangle.rotation = 0
                    }

                    if (madropdown.visible == true){
                        madropdown.visible = false
                        mabody.color = "#5d5d5d"
                        hiddenmabodyseparator.visible = false
                        separator5.anchors.top = mabody.bottom
                        matriangle.rotation = 0
                    }

                    if (infdropdown.visible == true){
                        infdropdown.visible = false
                        infbody.color = "#5d5d5d"
                        hiddenmabodyseparator.visible = false
                        separator6.anchors.top = infbody.bottom
                        inftriangle.rotation = 0
                    }

                } else {
                    ndropdown.visible = false
                    nbody.color = "#5d5d5d"
                    hiddennbodyseparator.visible = false
                    separator4.anchors.top = nbody.bottom
                    //scrollslide.contentHeight = drawer.height + ( drawer.height * 0.005 )
                    scrollslide.contentHeight = panel.height + ( panel.height * 0.005 )
                    ntriangle.rotation = 0
                }
            }
        }

    }

    Rectangle {
        id: hiddennbodyseparator
        color: "#000"
        height: 1
        anchors.top: nbody.bottom
        anchors.left: parent.left
        width: parent.width
        visible: false
    }

    //////////// SUBLEVEL: VIBRATION, MISSED CALLS AND VOICEMAIL ////////////
    Rectangle {
        id: ndropdown
        color: "#ff9e5e"
        visible: false
        height: ( toolBar.height * 3 ) + ( toolBar.height * 0.3 ) + 2
        width: parent.width
        anchors.top: hiddennbodyseparator.bottom


            //////////// VIBRATION ////////////
            Rectangle {
                id: vibody
                color: "#00000000"
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: viicon
                    anchors.left: vibody.left
                    anchors.leftMargin: vibody.width * 0.13
                    anchors.top: vibody.top
                    anchors.topMargin: vibody.height * 0.3
                    width: vi.height
                    height: vi.height
                    source: "images/nv.png"
                }

                Text {
                    id: vi
                    anchors.left: viicon.right
                    anchors.leftMargin: vibody.width * 0.04
                    anchors.top: vibody.top
                    anchors.topMargin: vibody.height * 0.3
                    text: "Vibration"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                Switch {

                    style: SwitchStyle {
                            groove: Rectangle {
                                    implicitWidth: vi.height * 3
                                    implicitHeight: vi.height
                                    radius: 8
                                    color: "#00000000"
                                        Rectangle {
                                            implicitWidth: vi.height * 1.7
                                            implicitHeight: vi.height
                                            radius: 8
                                            color: "#ff622e"
                                            border.width: 1
                                            border.color: "#ebebeb"
                                            anchors.left: parent.left
                                        }
                                        Rectangle {
                                            implicitWidth: vi.height * 1.7
                                            implicitHeight: vi.height
                                            radius: 8
                                            color: "#bbbbbb"
                                            border.width: 1
                                            border.color: "#ebebeb"
                                            anchors.right: parent.right
                                        }
                            }
                            handle: Rectangle {
                                    implicitWidth: vi.height * 1.7
                                    implicitHeight: vi.height
                                    radius: 8
                                    color: "#ebebeb"
                            }
                        }

                    id: viswitch
                    checked: true
                    anchors.right: vibody.right
                    anchors.rightMargin: vibody.width * 0.04
                    anchors.top: vibody.top
                    anchors.topMargin: vibody.height * 0.3
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: { if ( viswitch.checked == true ) {
                            viswitch.checked = false
                            console.log("Vibration is OFF")
                            }
                        else {
                            viswitch.checked = true
                            console.log("Vibration is ON")
                        }
                    }
                }
            }

            Rectangle {
                id: viandmcseparator
                color: "#000"
                height: 1
                anchors.top: vibody.bottom
                anchors.left: parent.left
                width: parent.width
            }

            //////////// MISSED CALLS ////////////
            Rectangle {
                id: mcbody
                color: "#00000000"
                anchors.top: viandmcseparator.bottom
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: mcicon
                    anchors.left: mcbody.left
                    anchors.leftMargin: mcbody.width * 0.13
                    anchors.top: mcbody.top
                    anchors.topMargin: mcbody.height * 0.3
                    width: mc.height
                    height: mc.height
                    source: "images/Phone.png"
                }

                Text {
                    id: mc
                    anchors.left: mcicon.right
                    anchors.leftMargin: mcbody.width * 0.04
                    anchors.top: mcbody.top
                    anchors.topMargin: mcbody.height * 0.3
                    text: "Missed Calls"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                Text {
                    id: mcno
                    anchors.right: mcbody.right
                    anchors.rightMargin: mcbody.width * 0.09
                    anchors.top: mcbody.top
                    anchors.topMargin: mcbody.height * 0.3
                    text: "0"
                    font.pixelSize: toolBar.height * 0.4
                    font.bold: true
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Missed Calls Clicked!")
                }
            }

            Rectangle {
                id: mcandvoseparator
                color: "#000"
                height: 1
                anchors.top: mcbody.bottom
                anchors.left: parent.left
                width: parent.width
            }

            //////////// VOICEMAIL ////////////
            Rectangle {
                id: vobody
                color: "#00000000"
                anchors.top: mcandvoseparator.bottom
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: voicon
                    anchors.left: vobody.left
                    anchors.leftMargin: vobody.width * 0.13
                    anchors.top: vobody.top
                    anchors.topMargin: vobody.height * 0.3
                    width: vo.height
                    height: vo.height
                    source: "images/Voicemail.png"
                }

                Text {
                    id: vo
                    anchors.left: voicon.right
                    anchors.leftMargin: vobody.width * 0.04
                    anchors.top: vobody.top
                    anchors.topMargin: vobody.height * 0.3
                    text: "Voicemail"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                Text {
                    id: vono
                    anchors.right: vobody.right
                    anchors.rightMargin: vobody.width * 0.09
                    anchors.top: vobody.top
                    anchors.topMargin: vobody.height * 0.3
                    text: "0"
                    font.pixelSize: toolBar.height * 0.4
                    font.bold: true
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Voicemail Clicked!")
                }
            }

    }

    Rectangle {
        id: separator4
        color: "#000"
        height: 1
        anchors.top: nbody.bottom
        anchors.left: parent.left
        width: parent.width
    }

    //////////// MY ACCOUNT ////////////
    Rectangle {
        id: mabody
        color: "#5d5d5d"
        width: parent.width
        height: toolBar.height + (toolBar.height * 0.1)
        anchors.top: separator4.bottom

        Image {
            id: maicon
            anchors.left: mabody.left
            anchors.leftMargin: mabody.width * 0.04
            anchors.top: mabody.top
            anchors.topMargin: mabody.height * 0.3
            width: ma.height
            height: ma.height
            source: "images/maicon.png"
        }

        Text {
            id: ma
            anchors.left: maicon.right
            anchors.leftMargin: mabody.width * 0.04
            anchors.top: mabody.top
            anchors.topMargin: mabody.height * 0.3
            text: "My Account"
            font.pixelSize: toolBar.height * 0.40
            color: "#fff"
        }

        Image {
            id: matriangle
            anchors.right: mabody.right
            anchors.rightMargin: mabody.width * 0.04
            anchors.top: mabody.top
            anchors.topMargin: mabody.height * 0.3
            width: ma.height
            height: ma.height
            source: "images/triangle.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
               if (madropdown.visible == false) {
                    madropdown.visible = true
                    mabody.color = "#fd6500"
                    hiddenmabodyseparator.visible = true
                    separator5.anchors.top = madropdown.bottom
                    separator5.anchors.topMargin = 0
                    //scrollslide.contentHeight = ( madropdown.height * 0.70 )  + drawer.height + ( drawer.height * 0.005 )
                    scrollslide.contentHeight = ( madropdown.height * 0.70 )  + panel.height + ( panel.height * 0.005 )
                    matriangle.rotation = 180

                    if (bcdropdown.visible == true) {
                        bcdropdown.visible = false
                        bcbody.color = "#5d5d5d"
                        hiddenbcbodyseparator.visible = false
                        separator3.anchors.top = bcbody.bottom
                        bctriangle.rotation = 0
                    }

                    if (dropdown.visible == true ) {
                        dropdown.visible = false
                        plbody.color = "#5d5d5d"
                        hiddenplbodyseparator.visible = false
                        separator2.anchors.top = plbody.bottom
                        pltriangle.rotation = 0
                    }

                    if (ndropdown.visible == true ) {
                        ndropdown.visible = false
                        nbody.color = "#5d5d5d"
                        hiddennbodyseparator.visible = false
                        separator4.anchors.top = nbody.bottom
                        ntriangle.rotation = 0
                    }

                    if (infdropdown.visible == true){
                        infdropdown.visible = false
                        infbody.color = "#5d5d5d"
                        hiddenmabodyseparator.visible = false
                        separator6.anchors.top = infbody.bottom
                        inftriangle.rotation = 0
                    }

                } else {
                    madropdown.visible = false
                    mabody.color = "#5d5d5d"
                    hiddenmabodyseparator.visible = false
                    separator5.anchors.top = mabody.bottom
                    //scrollslide.contentHeight = drawer.height + ( drawer.height * 0.005 )
                    scrollslide.contentHeight = panel.height + ( panel.height * 0.005 )
                    matriangle.rotation = 0
                }
            }
        }

    }

    Rectangle {
        id: hiddenmabodyseparator
        color: "#000"
        height: 1
        anchors.top: mabody.bottom
        anchors.left: parent.left
        width: parent.width
        visible: false
    }

    //////////// SUBLEVEL: BALANCE TOP UP, NEW NUMBER AND MY NUMBER ////////////
    Rectangle {
        id: madropdown
        color: "#ff9e5e"
        visible: false
        height: ( toolBar.height * 3 ) + ( toolBar.height * 0.3 ) + 2
        width: parent.width
        anchors.top: hiddenmabodyseparator.bottom


            //////////// BALANCE TOP UP ////////////
            Rectangle {
                id: btubody
                color: "#00000000"
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: btuicon
                    anchors.left: btubody.left
                    anchors.leftMargin: btubody.width * 0.13
                    anchors.top: btubody.top
                    anchors.topMargin: btubody.height * 0.3
                    width: btu.height
                    height: btu.height
                    source: "images/mabt.png"
                }

                Text {
                    id: btu
                    anchors.left: btuicon.right
                    anchors.leftMargin: btubody.width * 0.04
                    anchors.top: btubody.top
                    anchors.topMargin: btubody.height * 0.3
                    text: "Balance Top Up"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Balance Top Up Clicked!")
                }
            }

            Rectangle {
                id: btuandnnseparator
                color: "#000"
                height: 1
                anchors.top: btubody.bottom
                anchors.left: parent.left
                width: parent.width
            }

            //////////// NEW NUMBER ////////////
            Rectangle {
                id: nnbody
                color: "#00000000"
                anchors.top: btuandnnseparator.bottom
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: nnicon
                    anchors.left: nnbody.left
                    anchors.leftMargin: nnbody.width * 0.13
                    anchors.top: nnbody.top
                    anchors.topMargin: nnbody.height * 0.3
                    width: nn.height
                    height: nn.height
                    source: "images/mann.png"
                }

                Text {
                    id: nn
                    anchors.left: nnicon.right
                    anchors.leftMargin: nnbody.width * 0.04
                    anchors.top: nnbody.top
                    anchors.topMargin: nnbody.height * 0.3
                    text: "New Number"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("New Number Clicked!")
                }
            }

            Rectangle {
                id: nnandmnseparator
                color: "#000"
                height: 1
                anchors.top: nnbody.bottom
                anchors.left: parent.left
                width: parent.width
            }

            //////////// MY NUMBER ////////////
            Rectangle {
                id: mnbody
                color: "#00000000"
                anchors.top: nnandmnseparator.bottom
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: mnicon
                    anchors.left: mnbody.left
                    anchors.leftMargin: mnbody.width * 0.13
                    anchors.top: mnbody.top
                    anchors.topMargin: mnbody.height * 0.3
                    width: mn.height
                    height: mn.height
                    source: "images/mamn.png"
                }

                Text {
                    id: mn
                    anchors.left: mnicon.right
                    anchors.leftMargin: mnbody.width * 0.04
                    anchors.top: mnbody.top
                    anchors.topMargin: mnbody.height * 0.3
                    text: "My Number"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("My Number Clicked!")
                }
            }

    }

    Rectangle {
        id: separator5
        color: "#000"
        height: 1
        anchors.top: mabody.bottom
        anchors.left: parent.left
        width: parent.width
    }

    //////////// INVITE FRIENDS ////////////
    Rectangle {
        id: infbody
        color: "#5d5d5d"
        width: parent.width
        height: toolBar.height + (toolBar.height * 0.1)
        anchors.top: separator5.bottom
        Image {
            id: inficon
            anchors.left: infbody.left
            anchors.leftMargin: infbody.width * 0.04
            anchors.top: infbody.top
            anchors.topMargin: infbody.height * 0.3
            width: inf.height
            height: inf.height
            source: "images/ificon.png"
        }

        Text {
            id: inf
            anchors.left: inficon.right
            anchors.leftMargin: infbody.width * 0.04
            anchors.top: infbody.top
            anchors.topMargin: infbody.height * 0.3
            text: "Invite Friends"
            font.pixelSize: toolBar.height * 0.40
            color: "#fff"
        }

        Image {
            id: inftriangle
            anchors.right: infbody.right
            anchors.rightMargin: infbody.width * 0.04
            anchors.top: infbody.top
            anchors.topMargin: infbody.height * 0.3
            width: inf.height
            height: inf.height
            source: "images/triangle.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
               if (infdropdown.visible == false) {
                    infdropdown.visible = true
                    infbody.color = "#fd6500"
                    hiddeninfbodyseparator.visible = true
                    separator6.anchors.top = infdropdown.bottom
                    separator6.anchors.topMargin = 0
                    //scrollslide.contentHeight = ( infdropdown.height * 0.70 )  + drawer.height + ( drawer.height * 0.005 )
                    scrollslide.contentHeight = ( infdropdown.height * 0.70 )  + panel.height + ( panel.height * 0.005 )
                    inftriangle.rotation = 180

                    if (bcdropdown.visible == true) {
                        bcdropdown.visible = false
                        bcbody.color = "#5d5d5d"
                        hiddenbcbodyseparator.visible = false
                        separator3.anchors.top = bcbody.bottom
                        bctriangle.rotation = 0
                    }

                    if (dropdown.visible == true ) {
                        dropdown.visible = false
                        plbody.color = "#5d5d5d"
                        hiddenplbodyseparator.visible = false
                        separator2.anchors.top = plbody.bottom
                        pltriangle.rotation = 0
                    }

                    if (ndropdown.visible == true ) {
                        ndropdown.visible = false
                        nbody.color = "#5d5d5d"
                        hiddennbodyseparator.visible = false
                        separator4.anchors.top = nbody.bottom
                        ntriangle.rotation = 0
                    }

                    if (madropdown.visible == true){
                        madropdown.visible = false
                        mabody.color = "#5d5d5d"
                        hiddenmabodyseparator.visible = false
                        separator5.anchors.top = mabody.bottom
                        matriangle.rotation = 0
                    }


                } else {
                    infdropdown.visible = false
                    infbody.color = "#5d5d5d"
                    hiddenmabodyseparator.visible = false
                    separator6.anchors.top = infbody.bottom
                    //scrollslide.contentHeight = drawer.height + ( drawer.height * 0.005 )
                    scrollslide.contentHeight = panel.height + ( panel.height * 0.005 )
                    inftriangle.rotation = 0
                }
            }
        }

    }

    Rectangle {
        id: hiddeninfbodyseparator
        color: "#000"
        height: 1
        anchors.top: infbody.bottom
        anchors.left: parent.left
        width: parent.width
        visible: false
    }

    //////////// SUBLEVEL: BALANCE TOP UP, NEW NUMBER AND MY NUMBER ////////////
    Rectangle {
        id: infdropdown
        color: "#ff9e5e"
        visible: false
        height: ( toolBar.height * 3 ) + ( toolBar.height * 0.3 ) + 2
        width: parent.width
        anchors.top: hiddeninfbodyseparator.bottom

            //////////// FACEBOOK ////////////
            Rectangle {
                id: fbbody
                color: "#00000000"
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: fbicon
                    anchors.left: fbbody.left
                    anchors.leftMargin: fbbody.width * 0.13
                    anchors.top: fbbody.top
                    anchors.topMargin: fbbody.height * 0.3
                    width: fb.height
                    height: fb.height
                    source: "images/iff.png"
                }

                Text {
                    id: fb
                    anchors.left: fbicon.right
                    anchors.leftMargin: fbbody.width * 0.04
                    anchors.top: fbbody.top
                    anchors.topMargin: fbbody.height * 0.3
                    text: "Facebook"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Facebook Clicked!")
                }
            }

            Rectangle {
                id: fbandemseparator
                color: "#000"
                height: 1
                anchors.top: fbbody.bottom
                anchors.left: parent.left
                width: parent.width
            }

            //////////// EMAIL ////////////
            Rectangle {
                id: embody
                color: "#00000000"
                anchors.top: fbandemseparator.bottom
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: emicon
                    anchors.left: embody.left
                    anchors.leftMargin: embody.width * 0.13
                    anchors.top: embody.top
                    anchors.topMargin: embody.height * 0.3
                    width: em.height
                    height: em.height
                    source: "images/ife.png"
                }

                Text {
                    id: em
                    anchors.left: emicon.right
                    anchors.leftMargin: embody.width * 0.04
                    anchors.top: embody.top
                    anchors.topMargin: embody.height * 0.3
                    text: "Email"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Email Clicked!")
                }
            }

            Rectangle {
                id: emandsmsseparator
                color: "#000"
                height: 1
                anchors.top: embody.bottom
                anchors.left: parent.left
                width: parent.width
            }

            //////////// SMS ////////////
            Rectangle {
                id: smsbody
                color: "#00000000"
                anchors.top: emandsmsseparator.bottom
                width: parent.width
                height: toolBar.height + (toolBar.height * 0.1)

                Image {
                    id: smsicon
                    anchors.left: smsbody.left
                    anchors.leftMargin: smsbody.width * 0.13
                    anchors.top: smsbody.top
                    anchors.topMargin: smsbody.height * 0.3
                    width: sms.height
                    height: sms.height
                    source: "images/ifs.png"
                }

                Text {
                    id: sms
                    anchors.left: smsicon.right
                    anchors.leftMargin: smsbody.width * 0.04
                    anchors.top: smsbody.top
                    anchors.topMargin: smsbody.height * 0.3
                    text: "SMS"
                    font.pixelSize: toolBar.height * 0.40
                    color: "#fff"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("SMS Clicked!")
                }
            }

    }

    Rectangle {
        id: separator6
        color: "#000"
        height: 1
        anchors.top: infbody.bottom
        anchors.left: parent.left
        width: parent.width
    }

    //////////// AUTO START ////////////
    Rectangle {
        id: asosbody
        color: "#5d5d5d"
        width: parent.width
        height: toolBar.height + (toolBar.height * 0.1)
        anchors.top: separator6.bottom
        Image {
            id: asosicon
            anchors.left: asosbody.left
            anchors.leftMargin: asosbody.width * 0.04
            anchors.top: asosbody.top
            anchors.topMargin: asosbody.height * 0.3
            width: asos.height
            height: asos.height
            source: "images/asosicon.png"
        }

        Text {
            id: asos
            anchors.left: asosicon.right
            anchors.leftMargin: asosbody.width * 0.04
            anchors.top: asosbody.top
            anchors.topMargin: asosbody.height * 0.3
            text: "Auto-Start"
            font.pixelSize: toolBar.height * 0.40
            color: "#fff"
        }

        Switch {

            style: SwitchStyle {
                groove: Rectangle {
                        implicitWidth: asos.height * 3
                        implicitHeight: asos.height
                        radius: 8
                        color: "#00000000"
                            Rectangle {
                                implicitWidth: asos.height * 1.7
                                implicitHeight: asos.height
                                radius: 8
                                color: "#ff622e"
                                border.width: 1
                                border.color: "#ebebeb"
                                anchors.left: parent.left
                            }
                            Rectangle {
                                implicitWidth: asos.height * 1.7
                                implicitHeight: asos.height
                                radius: 8
                                color: "#bbbbbb"
                                border.width: 1
                                border.color: "#ebebeb"
                                anchors.right: parent.right
                            }
                }
                    handle: Rectangle {
                            implicitWidth: asos.height * 1.7
                            implicitHeight: asos.height
                            radius: 8
                            color: "#ebebeb"
                    }
                }

            id: asosswitch
            checked: true
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.04
            anchors.top: asosbody.top
            anchors.verticalCenter: asos.verticalCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if ( asosswitch.checked == true ) {
                    asosswitch.checked = false
                    console.log("Auto Start is OFF")
                    }
                else {
                    asosswitch.checked = true
                    console.log("Auto Start is ON")
                }
            }
        }
    }

    Rectangle {
        id: separator7
        color: "#000"
        height: 1
        anchors.top: asosbody.bottom
        anchors.left: parent.left
        width: parent.width
    }

    //////////// SELF DESTRUCT ////////////
    Rectangle {
        id: sdbody
        color: "#5d5d5d"
        width: parent.width
        height: toolBar.height + (toolBar.height * 0.1)
        anchors.top: separator7.bottom
    Image {
        id: sdicon
        anchors.left: sdbody.left
        anchors.leftMargin: sdbody.width * 0.04
        anchors.top: sdbody.top
        anchors.topMargin: sdbody.height * 0.3
        width: sd.height
        height: sd.height
        source: "images/sdicon.png"
    }

    Text {
        id: sd
        anchors.left: sdicon.right
        anchors.leftMargin: sdbody.width * 0.04
        anchors.top: sdbody.top
        anchors.topMargin: sdbody.height * 0.3
        text: "Self-Destruct"
        font.pixelSize: toolBar.height * 0.40
        color: "#fff"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: console.log("Self Destruct Clicked!")
    }

    }

    Rectangle {
        id: separator8
        color: "#000"
        height: 1
        anchors.top: sdbody.bottom
        anchors.left: parent.left
        width: parent.width
    }

    //////////// LOG OUT ////////////
    Rectangle {
        id: lobody
        color: "#5d5d5d"
        width: parent.width
        height: toolBar.height + (toolBar.height * 0.1)
        anchors.top: separator8.bottom
    Image {
        id: loicon
        anchors.left: lobody.left
        anchors.leftMargin: lobody.width * 0.04
        anchors.top: lobody.top
        anchors.topMargin: lobody.height * 0.3
        width: lo.height
        height: lo.height
        source: "images/loicon.png"
    }

    Text {
        id: lo
        anchors.left: loicon.right
        anchors.leftMargin: lobody.width * 0.04
        anchors.top: lobody.top
        anchors.topMargin: lobody.height * 0.3
        text: "Log Out"
        font.pixelSize: toolBar.height * 0.40
        color: "#fff"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Log Out Clicked!");
            Qt.quit();
        }
    }
    }

}

}
//Navigation Menus End

