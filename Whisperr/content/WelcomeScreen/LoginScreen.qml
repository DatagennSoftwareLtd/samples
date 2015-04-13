import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.1

Rectangle {
 id: loginscreen
 anchors.fill: parent
 color: "#e74710"
 Flickable {
     anchors.fill: parent
     //contentHeight: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.height + ( parent.height * 0.01) } else { parent.height * 2 } }

 Text {
     id: log_in_header
     text: "LOG IN"
     font.pixelSize: parent.height * 0.04
     font.family: "Raleway-Light"
     color: "#ffffff"
     smooth: true
     anchors.top: rr_layer.bottom
     anchors.topMargin: parent.height * 0.025
     anchors.horizontalCenter: rr_layer.horizontalCenter
 }

 Image {
     id: rr_layer
     source: "qrc:/images/welcomescreen/rr_layer.png"
     anchors.horizontalCenter: parent.horizontalCenter
     anchors.top: parent.top
     anchors.topMargin: parent.height * 0.075
     //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.80 } else { parent.width * 0.50 } }
     width: parent.width * 0.80
     height: parent.height * 0.20
 }
 Rectangle {
     id: facebook_background
     color: "#3b5999"
     anchors.top: log_in_header.bottom
     anchors.topMargin: parent.height * 0.01
     anchors.horizontalCenter: log_in_header.horizontalCenter
     //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
     width: parent.width * 0.90
     height: parent.height * 0.075
     radius: 5
     MultiPointTouchArea {
         id: facebook_backgroundpressed
         anchors.fill: parent
         onPressed: facebook_background.color = "#5783e2"
         onReleased: facebook_background.color = "#3b5999"
         onUpdated: facebook_background.color = "#3b5999"
     }
 }

 Text {
     id: facebook
     text: "Facebook"
     font.pixelSize: parent.height * 0.04
     font.family: "Raleway-Regular"
     color: "#ffffff"
     smooth: true
     anchors.horizontalCenter: facebook_background.horizontalCenter
     anchors.verticalCenter: facebook_background.verticalCenter
 }

 Image {
     id: facebook_logo
     source: "qrc:/images/welcomescreen/facebook_logo.png"
     anchors.verticalCenter: facebook_background.verticalCenter
     anchors.left: facebook_background.left
     anchors.leftMargin: parent.width * 0.025
     width: facebook.height
     height: facebook.height
 }

 Rectangle {
     id: orwithseparator1
     color: "#fff"
     height: 1
     width: facebook_background.width * 0.3
     anchors.right: or.left
     anchors.rightMargin: parent.height * 0.025
     anchors.verticalCenter: or.verticalCenter
 }

 Rectangle {
     id: orwithseparator2
     color: "#fff"
     height: 1
     width: facebook_background.width * 0.3
     anchors.left: or.right
     anchors.leftMargin: parent.height * 0.025
     anchors.verticalCenter: or.verticalCenter
 }


 Text {
     id: or
     text: "OR WITH"
     font.pixelSize: parent.height * 0.025
     font.family: "Raleway-Regular"
     color: "#ffffff"
     smooth: true
     anchors.top: facebook_background.bottom
     anchors.horizontalCenter: facebook_background.horizontalCenter
     anchors.topMargin: parent.height * 0.025
 }

 TextField {
     style: TextFieldStyle {
             textColor: "black"
             background: Rectangle {
                 border.color: "#fff"
                 border.width: 0
             }
     }
     id: username
     //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
     width: parent.width * 0.90
     height: parent.height * 0.10
     placeholderText: "Username"
     anchors.top: or.bottom
     anchors.horizontalCenter: facebook_background.horizontalCenter
     anchors.topMargin: parent.height * 0.025
     font.pixelSize: parent.height * 0.03
 }

 TextField {
     style: TextFieldStyle {
             textColor: "black"
             background: Rectangle {
                 border.color: "#fff"
                 border.width: 0
             }
     }
     id: password
     echoMode: TextInput.Password
     placeholderText: "Password"
     font.pixelSize: parent.height * 0.03
     anchors.top: username.bottom
     anchors.horizontalCenter: facebook_background.horizontalCenter
     anchors.topMargin: parent.height * 0.005
     //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
     width: parent.width * 0.90
     height: parent.height * 0.10
 }

 Item {
     id: loginbutton
     anchors.top: password.bottom
     anchors.topMargin: parent.height * 0.025
     anchors.horizontalCenter: facebook_background.horizontalCenter
     width: parent.width * 0.90
     height: parent.height * 0.10

     Rectangle {
         id: slbutton
         radius: 8
         anchors.top: parent.top
         anchors.horizontalCenter: parent.horizontalCenter
         width: parent.width
         height: parent.height*0.75

         gradient:unpressedDelegateItem

         Gradient {
             id: unpressedDelegateItem
             GradientStop { position: 0.0; color: "#ff7e27" }
             GradientStop { position: 1.0; color: "#fc6500"}
         }
         Gradient {
             id: pressedDelegateItem
             GradientStop { position: 0.0; color:  "#ff7e27"}
             GradientStop { position: 1.0; color:  "#ffb786"}
         }

     }

     Text {
         id: log_in
         text: "LOG IN"
         font.pixelSize: parent.height * 0.40
         font.family: "Raleway-Regular"
         color: "#ffffff"
         smooth: true
         anchors.centerIn:  slbutton
         opacity: 1
     }

     MouseArea {
         anchors.fill: parent
         onPressed: slbutton.gradient = pressedDelegateItem
         onReleased: slbutton.gradient = unpressedDelegateItem
         onClicked:
             facade.login(username.text, password.text, "en");
     }
 }
}
}
