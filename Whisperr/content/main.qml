import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

import "SliderMenu"
import "DashBoard"

//import "CustomItems"

ApplicationWindow {
    title: qsTr("Whisperr")
    width: 640
    height: 480
    visible: true
    id: whisperrMain
    color: "#e74710"

    // toolbar
    toolBar:
        WhisperrToolBar
        {
            visible: false
            width: whisperrMain.width
            height: whisperrMain.height * 0.075
        }

    Connections {
        target: toolBar
        onBackButtonClicked:{
            console.log("BackButtonClicked");
            stackView.pop()
        }
        onSearchButtonClicked:
        {
            console.log("toolBar searchButton clicked");

            if (backgrounddim.visible == false) {
                if (searchpopup.visible == false) {
                    searchpopup.visible = true
                } else {
                    searchpopup.visible = false
                }
            }
        }
        onNewmessageButtonClicked:
        {
            if (backgrounddim.visible == false) {
                newmessagepopup.visible = true
                scaleAnimation.start()
                backgrounddim.visible = true
                if (searchpopup.visible == true) {
                    searchpopup.visible = false
                }
            }
        }
        onSettingsButtonClicked:{
            console.log("mainPage.y = " + mainPage.y);
        }
    }

    // footer
    statusBar:
        WhisperrFooterBar
        {
            width: whisperrMain.width
            height: whisperrMain.height * 0.075
            visible: false
        }

    Connections
    {
        target: statusBar
        onCameraButtonClicked:
        {
            stackView.push(Qt.resolvedUrl("qrc:/content/Camera.qml"));
        }
    }

    WhisperrMenu{
        visualParent: stackView
        parent: stackView
        _topMargin: toolBar.height
        position: Qt.LeftEdge
        color: "#5d5d5d"
        id: menu
        visible: false
        enabled: false
    }

    Connections
    {
        target: menu
        onLogOut:
        {
            //stackView.push(Qt.resolvedUrl("qrc:/content/Camera.qml"));
            while(stackView.depth != 1)
                stackView.pop();

            menu.open = false;
            menu.completeSlideDirection();
            menu.visible = false;
            menu.enabled = false;
            whisperrMain.toolBar.visible = false;
            whisperrMain.statusBar.visible = false;
        }
    }

    // dash board

    StackView {
        id: stackView
        anchors.fill: parent

        // Implements back key navigation
        focus: true
        Keys.onReleased:{
            if (event.key === Qt.Key_Back && stackView.depth > 1) {
                stackView.pop();
                event.accepted = true;
            }
            else if (event.key === Qt.Key_Menu)
            {
                console.log("popup");
                popupMenu.popup();
                event.accepted = true;
            }
        }

/*
        initialItem:

            Rectangle {
                id: mainPage
                anchors.top: toolBar.bottom
                anchors.bottom: statusBar.top
                width: parent.width
                //height: parent.height
                color: "#e74710"
                Text{
                    text: "Welcome\nWhisperr"
                    color: "white"
                    font.pixelSize: 50
                    anchors.centerIn: parent
                }
            }
*/

        Loader{
            id: welcomescreen
            source: Qt.resolvedUrl("qrc:/content/WelcomeScreen/login.qml")

            // login - ok
            Connections {
                target: welcomescreen.item
                onLogin: {
                    console.log("stackView.push(dashBoard)");
                    stackView.push(mainPage/*dashBoard*/);

                    menu.visible = true
                    menu.enabled = true

                    whisperrMain.toolBar.visible = true;
                    whisperrMain.statusBar.visible = true;
                }
            }
            onLoaded:{
                console.log("stackView.push(welcomescreen.item)");
                stackView.push(welcomescreen.item);

            }
        }

        //Component{
          //  id: dashBoard
            Rectangle {
                id: mainPage
                //anchors.top: toolBar.bottom
                //anchors.bottom: statusBar.top

                width: parent.width
                height: parent.height
                color: "#e74710"
                Text{
                    text: "Welcome\nWhisperr"
                    color: "white"
                    font.pixelSize: 50
                    anchors.centerIn: parent
                    id:log
                }
            }
       // }

    }


    ////////// POP-UPS //////////
   ////////// SEARCH //////////
   Rectangle {
       id: searchpopup
       anchors.top: toolBar.bottom
       anchors.right: parent.right
       anchors.rightMargin: parent.width * 0.05
       color: "#eaeaea"
       radius: 10
       border.width: 2
       border.color: "#a7a7a7"
       width: parent.width * 0.75
       height: toolBar.height
       visible: false

       TextField {
           style: TextFieldStyle {
                   textColor: "black"
                   background: Rectangle {
                       border.color: "#00000000"
                       border.width: 0
                       color: "#00000000"
                   }
           }
           id: searchfield
           width: parent.width * 0.70
           placeholderText: "Search . . ."
           anchors.top: parent.top
           anchors.left: parent.left
           font.pixelSize: toolBar.height * 0.40
           height: parent.height
       }

       Rectangle {
           id: searchbutton
           anchors.top: parent.top
           anchors.topMargin: parent.height * 0.05
           anchors.right: parent.right
           anchors.rightMargin: parent.width * 0.005
           width: parent.width * 0.30
           height: parent.height * 0.90
           color: "#e74710"
           radius: 10

           Text {
               anchors.top: parent.top
               anchors.topMargin: parent.height * 0.20
               anchors.horizontalCenter: parent.horizontalCenter
               text: "Search"
               font.pixelSize: toolBar.height * 0.40
               color: "#fff"
           }

           MouseArea {
               anchors.fill: parent
               onPressed: searchbutton.color = "#ff9571"
               onReleased: {
                   searchbutton.color = "#e74710"
                   searchpopup.visible = false
               }
           }

       }

   }

   ////////// NEW MESSAGE //////////
   Rectangle {
       id: newmessagepopup
       anchors.top: toolBar.bottom
       anchors.topMargin: toolBar.height / 2
       anchors.horizontalCenter: parent.horizontalCenter
       width: parent.width * 0.80
       height: parent.height * 0.50
       radius: 10
       visible: false
       border.width: 2
       border.color: "#a7a7a7"
       z: 3

       Rectangle {
           id: messagepopupheadercontinue
           anchors.top: parent.top//messagepopupheader.top
           anchors.topMargin: 2//parent.height * 0.025
           anchors.left: parent.left
           width: parent.width-4
           height: parent.height * 0.15
           color: "#e74710"
           anchors.margins: 2
           radius: 10

           Text  {
               anchors.top: parent.top
               anchors.topMargin: parent.height * 0.20
               anchors.left: parent.left
               anchors.leftMargin: parent.width * 0.05
               text: "Create New Message"
               font.pixelSize: toolBar.height * 0.40
               color: "#fff"
           }

           Image {
               anchors.top: parent.top
               anchors.topMargin: 2
               anchors.right: parent.right
               anchors.rightMargin: parent.width * 0.025
               height: parent.height * 0.85
               width: parent.height * 0.85
               source: "qrc:/images/x.png"
               id: closeImg

               MouseArea {
                   anchors.fill: parent
                   onClicked: {
                       newmessagepopup.visible = false
                       backgrounddim.visible = false
                   }
                   onPressed: closeImg.scale = 0.9
                   onReleased: closeImg.scale = 1.0
               }

           }
       }

       Rectangle {
           id: contactandmessageseparator
           anchors.top: messagepopupheadercontinue.bottom
           anchors.topMargin: parent.height * 0.15
           anchors.horizontalCenter: parent.horizontalCenter
           height: 1
           width: parent.width
           color: "lightgray"
       }

       TextField {
           style: TextFieldStyle {
                   textColor: "black"
                   background: Rectangle {
                       border.color: "#00000000"
                       border.width: 0
                       color: "#00000000"
                   }
           }
           id: newmessagecontactfield
           width: parent.width
           placeholderText: "To"
           anchors.top: messagepopupheadercontinue.bottom
           anchors.horizontalCenter: parent.horizontalCenter
           font.pixelSize: toolBar.height * 0.40
           height: parent.height * 0.15
       }

       TextField {
           style: TextFieldStyle {
                   textColor: "black"
                   background: Rectangle {
                       border.color: "#00000000"
                       border.width: 0
                       color: "#00000000"
                   }
           }
           id: newmessagefield
           width: parent.width
           placeholderText: "Type Here . . ."
           anchors.top: newmessagecontactfield.bottom
           anchors.horizontalCenter: parent.horizontalCenter
           font.pixelSize: toolBar.height * 0.40
           height: parent.height * 0.15
       }

       Image {
           id: newmessagesendbutton
           anchors.bottom: parent.bottom
           anchors.bottomMargin: parent.height * 0.04
           anchors.right: parent.right
           anchors.rightMargin: parent.height * 0.04
           width: messagepopupheadercontinue.height
           height: messagepopupheadercontinue.height
           source: "qrc:/images/Send.png"
       }

   }

   Rectangle {
       id: backgrounddim
       anchors.fill: parent
       color: "#000"
       opacity: 0.5
       visible: false
       z: 2
   }

   ////////// ANIMATIONS //////////
  PropertyAnimation {
      id: scaleAnimation
      target: newmessagepopup
      property: "scale"
      from: 0
      to: 1
      duration: 500
      easing.type: Easing.OutBack
  }
  NumberAnimation {
      id: opacityAnimation
      target: newmessagepopup
      property: "opacity"
      from: 0
      to: 1
      duration: 1000
      easing.type: Easing.OutSine
  }
/*
    Keys.onReleased:{

       if (event.key === Qt.Key_Menu)
       {
           console.log("popup");
           popupMenu.popup();
           event.accepted = true;
       }

       console.log(event.key);
   }
*/
    TextArea {
        id: whisperrLog
        anchors.fill: parent
        visible: false
    }
    Connections {
        target: facade
        onStatusMessageChanged: {
            var oldText = whisperrLog.text;
            whisperrLog.text = oldText + "\n" + msg;
        }
    }

    Menu {
        id: popupMenu

        MenuItem {
            text: "debug mode on"
            onTriggered:{
                text = (text === "debug mode off")? "debug mode on" : "debug mode off";
                whisperrLog.visible = (text === "debug mode off")? true : false;
            }

        }
    }



}

