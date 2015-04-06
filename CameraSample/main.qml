import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

ApplicationWindow {
    title: "Camera Sample"
    id: mainWindow
    width: 720
    height: 1280
    visible: true

    Loader {
        id: photocamera
        anchors.fill: parent
        source: "camera.qml"
        onLoaded:
        {
            console.log("loaded");
        }

        visible: false
    }

   Rectangle {
       id: conversationscreen
       anchors.fill: parent
       visible: true

       Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: parent.width
            height: parent.height * 0.075
            color: "#e74710"
            id: toolBar

       Rectangle{
           id: settings
           anchors.right: parent.right
           anchors.top: parent.top
           height: toolBar.height
           width: toolBar.height
           color: "#00000000"

           Image {
               anchors.right: parent.right
               anchors.rightMargin: parent.height * 0.20
               anchors.top: parent.top
               anchors.topMargin: parent.height * 0.20
               width: parent.height * 0.6
               height: parent.height * 0.6
               source: "images/settingsicon.png"
           }
           MouseArea {
               anchors.fill: parent
               onPressed: { if (backgrounddim.visible == false) { settings.color = "#ff9571" } }
               onReleased: { if (backgrounddim.visible == false) {
                                   settings.color = "#00000000"
                               }
               }
           }
       }

       Rectangle{
           id: newmessage
           anchors.right: settings.left
           anchors.top: parent.top
           height: toolBar.height
           width: toolBar.height
           color: "#00000000"

           Image {
               anchors.right: parent.right
               anchors.rightMargin: parent.height * 0.20
               anchors.top: parent.top
               anchors.topMargin: parent.height * 0.20
               width: parent.height * 0.6
               height: parent.height * 0.6
               source: "images/newmessage.png"
           }

           MouseArea{
               anchors.fill: parent
               onPressed: { if (backgrounddim.visible == false) {
                       newmessage.color = "#ff9571" }
                   }
               onReleased: { if (backgrounddim.visible == false) {
                       newmessagepopup.visible = true
                       scaleAnimation.start()
                       backgrounddim.visible = true
                       newmessage.color = "#00000000" }
                             if (searchpopup.visible == true) {
                                 searchpopup.visible = false
                             }
                   }
           }

       }

       Rectangle{
           id: search
           anchors.right: newmessage.left
           anchors.top: parent.top
           height: toolBar.height
           width: toolBar.height
           color: "#00000000"

           Image {
               anchors.right: parent.right
               anchors.rightMargin: parent.height * 0.20
               anchors.top: parent.top
               anchors.topMargin: parent.height * 0.20
               width: parent.height * 0.6
               height: parent.height * 0.6
               source: "images/searchicon.png"
           }

           MouseArea {
               anchors.fill: parent
               onPressed: { if (backgrounddim.visible == false) { search.color = "#ff9571" } }
               onReleased: { if (backgrounddim.visible == false) {
                               if (searchpopup.visible == false) {
                                   search.color = "#00000000"
                                   searchpopup.visible = true
                               } else {
                                   search.color = "#00000000"
                                   searchpopup.visible = false
                               }
                               }
               }
           }

       }

       Rectangle {
           id: backicon
           anchors.left: parent.left
           anchors.top: parent.top
           height: toolBar.height
           width: toolBar.height
           color: "#00000000"
       Image {
           anchors.left: parent.left
           anchors.leftMargin: parent.height * 0.20
           anchors.top: parent.top
           anchors.topMargin: parent.height * 0.20
           width: parent.height * 0.6
           height: parent.height * 0.6
           source: "images/backicon.png"
       }

       MouseArea {
           anchors.fill: parent
           onPressed: { if (backgrounddim.visible == false) { backicon.color = "#ff9571" } }
           onReleased: { if (backgrounddim.visible == false) {
                               backicon.color = "#00000000"
                           }
           }
       }

       }
       Image {
           id: contactsicon
           anchors.left: backicon.right
           anchors.leftMargin: toolBar.height * 0.30
           anchors.top: toolBar.top
           anchors.topMargin: toolBar.height * 0.10
           width: toolBar.height * 0.8
           height: toolBar.height * 0.8
           source: "images/contacts.png"
       }

       Text {
           id: person
           anchors.left: contactsicon.right
           anchors.leftMargin: toolBar.height * 0.20
           anchors.top: toolBar.top
           anchors.topMargin: toolBar.height * 0.15
           text: "Person 1"
           font.pixelSize: toolBar.height * 0.40
           color: "#fff"
       }

       Text {
           id: personstatus
           anchors.left: contactsicon.right
           anchors.leftMargin: toolBar.height * 0.30
           anchors.top: person.bottom
           text: "Online"
           font.pixelSize: toolBar.height * 0.20
           color: "#fff"
       }
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
           z: 3
           Rectangle {
               id: messagepopupheader
               anchors.top: parent.top
               anchors.left: parent.left
               width: parent.width
               height: parent.height * 0.05
               radius: 10
               color: "#e74710"
           }
           Rectangle {
               id: messagepopupheadercontinue
               anchors.top: messagepopupheader.top
               anchors.topMargin: parent.height * 0.025
               anchors.left: parent.left
               width: parent.width
               height: parent.height * 0.15
               color: "#e74710"

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
                   anchors.right: parent.right
                   anchors.rightMargin: parent.width * 0.025
                   height: parent.height * 0.85
                   width: parent.height * 0.85
                   source: "images/x.png"

                   MouseArea {
                       anchors.fill: parent
                       onClicked: {
                           newmessagepopup.visible = false
                           backgrounddim.visible = false
                       }
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
               source: "images/Send.png"
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

       ////////// FOOTER //////////
       Rectangle {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width
            height: parent.height * 0.075
            color: "lightgray"
            id: footer
        }

       Image {
           id: microphone
           anchors.right: parent.right
           anchors.rightMargin: footer.height * 0.2
           anchors.top: footer.top
           anchors.topMargin: footer.height * 0.15
           width: footer.height * 0.7
           height: footer.height * 0.7
           source: "images/microphone.png"
       }

       Image {
           id: textbox
           anchors.left: emoticon.right
           anchors.leftMargin: footer.height * 0.2
           anchors.right: microphone.left
           anchors.rightMargin: footer.height * 0.2
           anchors.bottom: parent.bottom
           anchors.bottomMargin: footer.height * 0.15
           height: footer.height * 0.2
           source: "images/text_box.png"
           z: 1
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
           id: textboxchat
           width: textbox.width
           placeholderText: "Type here . . . "
           anchors.top: footer.top
           anchors.horizontalCenter: textbox.horizontalCenter
           anchors.topMargin: footer.height * 0.2
           font.pixelSize: parent.height * 0.03
           height: footer.height * 0.65
       }

       Image {
           id: camera
           anchors.left: parent.left
           anchors.leftMargin: footer.height * 0.2
           anchors.top: footer.top
           anchors.topMargin: footer.height * 0.15
           width: footer.height * 0.7
           height: footer.height * 0.7
           source: "images/camera.png"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   photocamera.visible = true
                   conversationscreen.visible = false
               }
           }
       }

       Image {
           id: emoticon
           anchors.left: camera.right
           anchors.leftMargin: footer.height * 0.2
           anchors.top: footer.top
           anchors.topMargin: footer.height * 0.15
           width: footer.height * 0.7
           height: footer.height * 0.7
           source: "images/emoticon.png"
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
   }
}


