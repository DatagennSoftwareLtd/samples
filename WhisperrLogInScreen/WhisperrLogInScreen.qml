//import Qt 4.7
import QtQuick 2.4

Item {
    id: logInScreen
    //width:720
    //height:800

    // background
    Image {
        id: background
        source: "qrc:/images/background.png"
        anchors.fill: logInScreen
        opacity: 1
    }

    // logo "Whisperr"
    Image {
        id: rr_layer
        source: "qrc:/images/rr_layer.png"
        width: logInScreen.width
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.top: logInScreen.height/10
        anchors.leftMargin: 10.0
        anchors.rightMargin: 10.0
        opacity: 1
        y: logInScreen.height/20
    }

    // "LOG IN" text
    Text {
        id: log_in_header
        text: "LOG IN"
        width: logInScreen.width
        anchors.horizontalCenter: logInScreen.horizontalCenter
        anchors.top: rr_layer.bottom
        horizontalAlignment: Text.Center

        font.pixelSize: 20
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        opacity: 1
    }


    // "facebook" button
    Rectangle
    {
        id: facebookButton
        //width: logInScreen.width
        height: 40
        anchors.top: log_in_header.bottom
        anchors.left: logInScreen.left
        anchors.right: logInScreen.right
        anchors.leftMargin: 30.0
        anchors.rightMargin: 30.0

        Image {
            id: facebook_background
            source: "qrc:/images/facebook_background.png"
            //width: facebookButton.width
            //height: facebookButton.height
            anchors.fill: facebookButton
            opacity: 1
        }
        Image {
            id: facebook_logo
            source: "qrc:/images/facebook_logo.png"
            anchors.left: facebookButton.left
            height: facebookButton.height
            width: facebookButton.height
            opacity: 1
        }
        Text {
            id: facebook
            width: parent.width
            anchors.horizontalCenter: facebookButton.horizontalCenter
            anchors.left: facebook_logo.right
            horizontalAlignment: Text.Center
            verticalAlignment: Text.Center
            text: "Facebook"
            font.pixelSize: 20
            font.family: "Raleway-Regular"
            color: "#ffffff"
            smooth: true
            opacity: 1
        }

    }

    Rectangle
    {
        id: orRectangle
        width: logInScreen.width
        height: 30//logInScreen.height/15
        anchors.top: facebookButton.bottom

        Image {
            source: "qrc:/images/background.png"
            anchors.fill: orRectangle
            opacity: 1
        }

        Image {
            id: line_1
            source: "qrc:/images/line_1.png"
            opacity: 1
            anchors.left: orRectangle.left
            //anchors.top: orRectangle.height/2
        }
        Image {
            id: line_2
            source: "qrc:/images/line_2.png"
            opacity: 1
            anchors.right: orRectangle.right
            //anchors.topMargin: orRectangle.height/2
            //anchors.top: orRectangle.bottom
        }

        Text {
            id: orId
            text: "OR"
            width: orRectangle.width
            anchors.horizontalCenter: orRectangle.horizontalCenter
            horizontalAlignment: Text.Center
            font.pixelSize: 20
            font.family: "Raleway-Regular"
            color: "#ffffff"
            smooth: true
            opacity: 1
        }
    }

    Rectangle
    {
        id: log_in_and_password_field
        width: logInScreen.width
        height: 50//logInScreen.height/15
        anchors.top: orRectangle.bottom

        Image {
            source: "qrc:/images/log_in_and_password_field.png"
            height: 50
            anchors.fill: log_in_and_password_field
            opacity: 1
        }

        Text {
            id: username
            text: "Username"
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: log_in_and_password_field.top
            font.pixelSize: 20
            font.family: "Raleway-Regular"
            color: "#d9d9d9"
            smooth: true
            opacity: 1
        }

        Image {
            id: log_in_and_password_separator
            source: "qrc:/images/log_in_and_password_separator.png"
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: username.bottom
            opacity: 1
        }

        Text {
            id: password
            text: "Password"
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: log_in_and_password_separator.bottom
            font.pixelSize: 20
            font.family: "Raleway-Regular"
            color: "#999999"
            smooth: true
            opacity: 1
        }
    }

    Rectangle
    {
        id: log_in_button
        width: logInScreen.width
        height: 50//logInScreen.height/15
        anchors.top: log_in_and_password_field.bottom
        Image {
            source: "qrc:/images/log_in_button.png"
            anchors.fill: log_in_button
            opacity: 1
        }
        Text {
            id: log_in
            text: "LOG IN"
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.Center
            font.pixelSize: 24
            font.family: "Raleway-Regular"
            color: "#ffffff"
            smooth: true
            opacity: 1
        }
    }

    Rectangle
    {
        id: sign_up_button
        width: logInScreen.width
        height: 50//logInScreen.height/15
        anchors.top: log_in_button.bottom
        Image {
            source: "qrc:/images/sing_up_button.png"
            opacity: 1
            anchors.fill: sign_up_button
        }
        Text {
            id: sign_up
            text: "SIGN UP"
            font.pixelSize: 24
            font.family: "Raleway-Regular"
            color: "#ffffff"
            smooth: true
            opacity: 1
            width: parent.width
            horizontalAlignment: Text.Center
            anchors.horizontalCenter: sign_up_button.horizontalCenter
        }
    }

    Text {
        id: create_new_account_
        text: "Create New Account"
        font.pixelSize: 20
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        opacity: 1
        width: logInScreen.width
        horizontalAlignment: Text.Center
        anchors.horizontalCenter: logInScreen.horizontalCenter
        anchors.bottom: forgotten_password__.top
    }
    Text {
        id: forgotten_password__
        text: "Forgotten Password?"
        font.pixelSize: 20
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        opacity: 1
        width: logInScreen.width
        horizontalAlignment: Text.Center
        anchors.horizontalCenter: logInScreen.horizontalCenter
        anchors.bottom: change_language__.top
    }
    Text {
        id: change_language__
        text: "Change Language"
        font.pixelSize: 20
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        opacity: 1
        width: logInScreen.width
        horizontalAlignment: Text.Center
        anchors.horizontalCenter: logInScreen.horizontalCenter
        anchors.bottom: logInScreen.bottom
    }
}
