import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.1

Rectangle {
id: signupscreen
anchors.fill: parent
color: "#e74710"

Flickable {
    anchors.fill: parent
    //contentHeight: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.height + ( parent.height * 0.01) } else { parent.height * 2 } }

Text {
    id: signupheader
    text: "SIGN UP"
    font.pixelSize: parent.height * 0.04
    font.family: "Raleway-Light"
    color: "#ffffff"
    smooth: true
    anchors.top: signupwhisperr.bottom
    anchors.topMargin: parent.height * 0.025
    anchors.horizontalCenter: signupwhisperr.horizontalCenter
    opacity: 1
}

Image {
    id: signupwhisperr
    source: "qrc:/images/welcomescreen/rr_layer.png"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.topMargin: parent.height * 0.075
    //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.80 } else { parent.width * 0.50 } }
    width: parent.width * 0.80
    height: parent.height * 0.20
    opacity: 1
}
Rectangle {
    id: signupfbbg
    color: "#3b5999"
    anchors.top: signupheader.bottom
    anchors.topMargin: parent.height * 0.01
    anchors.horizontalCenter: signupheader.horizontalCenter
    //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
    width: parent.width * 0.90
    height: parent.height * 0.075
    radius: 5
    opacity: 1
    MultiPointTouchArea {
        anchors.fill: parent
        onPressed: signupfbbg.color = "#5783e2"
        onReleased: signupfbbg.color = "#3b5999"
        onUpdated: signupfbbg.color = "#3b5999"
    }
}

Text {
    id: signupfb
    text: "Facebook"
    font.pixelSize: parent.height * 0.04
    font.family: "Raleway-Regular"
    color: "#ffffff"
    smooth: true
    anchors.horizontalCenter: signupfbbg.horizontalCenter
    anchors.verticalCenter: signupfbbg.verticalCenter
    opacity: 1
}

Image {
    id: signupfblogo
    source: "qrc:/images/welcomescreen/facebook_logo.png"
    anchors.verticalCenter: signupfbbg.verticalCenter
    anchors.left: signupfbbg.left
    anchors.leftMargin: parent.width * 0.025
    width: signupfb.height
    height: signupfb.height
    opacity: 1
}

Rectangle {
    id: signuporseparatorL
    color: "#fff"
    height: 1
    width: signupfbbg.width * 0.3
    anchors.right: signupOR.left
    anchors.rightMargin: parent.height * 0.025
    anchors.verticalCenter: signupOR.verticalCenter
}

Rectangle {
    id: signuporseparatorR
    color: "#fff"
    height: 1
    width: signupfbbg.width * 0.3
    anchors.left: signupOR.right
    anchors.leftMargin: parent.height * 0.025
    anchors.verticalCenter: signupOR.verticalCenter
}


Text {
    id: signupOR
    text: "OR WITH"
    font.pixelSize: parent.height * 0.025
    font.family: "Raleway-Regular"
    color: "#ffffff"
    smooth: true
    anchors.top: signupfbbg.bottom
    anchors.horizontalCenter: signupfbbg.horizontalCenter
    anchors.topMargin: parent.height * 0.025
    opacity: 1
}

TextField {
    style: TextFieldStyle {
            textColor: "black"
            background: Rectangle {
                border.color: "#fff"
                border.width: 0
            }
    }
    id: signupusername
    //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
    width: parent.width * 0.90
    height: parent.height * 0.10
    placeholderText: "Email Address"
    anchors.top: signupOR.bottom
    anchors.horizontalCenter: signupfbbg.horizontalCenter
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
    id: signuppassword
    echoMode: TextInput.Password
    placeholderText: "Password"
    font.pixelSize: parent.height * 0.03
    anchors.top: signupusername.bottom
    anchors.horizontalCenter: signupfbbg.horizontalCenter
    anchors.topMargin: parent.height * 0.005
    //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
    width: parent.width * 0.90
    height: parent.height * 0.10
}

Item {
    id: signuploginbutton
    anchors.top: signuppassword.bottom
    anchors.topMargin: parent.height * 0.025
    anchors.horizontalCenter: signupfbbg.horizontalCenter
    //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
    width: parent.width * 0.90
    height: parent.height * 0.10

    Rectangle {
        id: signupbutton
        color: "#fc6500"
        radius: 8
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: parent.height * 0.75
        opacity: 1
    }

    Rectangle {
        id: signupbuttonlight
        color: "#ff7e27"
        radius: 8
        anchors.top: signupbutton.top
        anchors.horizontalCenter: signupbutton.horizontalCenter
        width: parent.width
        height: signupbutton.height * 0.50
        opacity: 1
    }

    Text {
        id: sign_up
        text: "SIGN UP"
        font.pixelSize: parent.height * 0.40
        font.family: "Raleway-Regular"
        color: "#ffffff"
        smooth: true
        anchors.top: signupbutton.top
        anchors.horizontalCenter: signupbutton.horizontalCenter
        anchors.topMargin: parent.height * 0.10
        opacity: 1
    }

    MouseArea{
    //MultiPointTouchArea {
        id: signupbuttontouch
        anchors.fill: parent
        onPressed: { signupbutton.color = "#ffb786"; signupbutton.color = "#ffb786" }
        onReleased: {
            signupbutton.color = "#fc6500";
            signupbutton.color = "#ff7e27";
            //welcomescreen.source = "conversation.qml"
        }

        onClicked:
        {
            facade.signup(signupusername.text, signuppassword.text, "en");
        }
    }

}
}
}
