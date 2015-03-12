//import Qt 4.7
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

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
        anchors.topMargin: 20
        horizontalAlignment: Text.Center

        font.pixelSize: 20
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        opacity: 1
    }

    // "facebook" button
    Button {
        id: facebookButton
        //width: logInScreen.width
        height: 40
        anchors.top: log_in_header.bottom
        anchors.left: logInScreen.left
        anchors.right: logInScreen.right
        anchors.leftMargin: 30.0
        anchors.rightMargin: 30.0

        onClicked:
        {
            console.log("facebookButton clicked");
        }

        style: ButtonStyle {
            background: Rectangle {
                Image {
                    id: facebook_background
                    source: control.pressed ? "qrc:/images/facebook_background_pressed.png" : "qrc:/images/facebook_background.png"
                    anchors.fill: parent
                    opacity: 1
                }
                Image {
                    id: facebook_logo
                    source: "qrc:/images/facebook_logo.png"
                    //anchors.left: facebookButton.left
                    height: facebookButton.height
                    width: facebookButton.height
                    opacity: 1
                }
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
            }
            label: Text {
                id: facebook
                width: parent.width
                //anchors.horizontalCenter: facebookButton.horizontalCenter
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
    }


    Rectangle
    {
        id: orRectangle
        width: logInScreen.width
        height: 30//logInScreen.height/15
        anchors.top: facebookButton.bottom
        anchors.topMargin: 20

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

        TextInput {
            id: username
            text: "Username"
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: log_in_and_password_field.top
            font.pixelSize: 20
            font.family: "Raleway-Regular"
            color: "#999999"
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

        TextInput {
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

    // login button
    Button {
        id: log_in_button
        width: logInScreen.width
        height: 50//logInScreen.height/15
        anchors.top: log_in_and_password_field.bottom
        anchors.topMargin: 20

        style: ButtonStyle {
            background: BorderImage {
                    id: login_background
                    source: control.pressed ? "qrc:/images/log_in_button_pressed.png" : "qrc:/images/log_in_button.png"
                    border.left: 4 ; border.right: 4
                    border.top: 4 ; border.bottom: 4
                }

            label: Text {
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

    }

    // signup button
    Button {
        id: sign_up_button
        width: logInScreen.width
        height: 50//logInScreen.height/15
        anchors.top: log_in_button.bottom
        anchors.topMargin: 5

        style: ButtonStyle {
            background: BorderImage {
                    id: signup_background
                    source: control.pressed ? "qrc:/images/sing_up_button_pressed.png" : "qrc:/images/sing_up_button.png"
                    border.left: 4 ; border.right: 4
                    border.top: 4 ; border.bottom: 4
                }

            label: Text {
                id: sign_up
                text: "SIGN UP"
                font.pixelSize: 24
                font.family: "Raleway-Regular"
                color: "#ffffff"
                smooth: true
                opacity: 1
                width: parent.width
                horizontalAlignment: Text.Center
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

    }

    Button {
        id: create_new_account
        anchors.bottom: forgotten_password.top
        width: logInScreen.width
        height: 30
        style: ButtonStyle {
            label: Text {
                text: "Create New Account"
                font.pixelSize: 20
                font.family: "Raleway-Light"
                color: "#ffffff"
                smooth: true
                opacity: 1
                width: logInScreen.width
                horizontalAlignment: Text.Center
                //anchors.horizontalCenter: logInScreen.horizontalCenter

            }
            background: BorderImage {
                source: control.pressed ? "qrc:/images/background_button_pressed.png" : "qrc:/images/background_button.png"
                border.left: 4 ; border.right: 4
                border.top: 4 ; border.bottom: 4
            }
        }
    }

    Button {
        id: forgotten_password
        width: logInScreen.width
        height: 30
        anchors.bottom: change_language.top

        style: ButtonStyle {
            label: Text {
                text: "Forgotten Password?"
                font.pixelSize: 20
                font.family: "Raleway-Light"
                color: "#ffffff"
                smooth: true
                opacity: 1
                width: logInScreen.width
                horizontalAlignment: Text.Center
                //anchors.horizontalCenter: logInScreen.horizontalCenter

            }
            background: BorderImage {
                source: control.pressed ? "qrc:/images/background_button_pressed.png" : "qrc:/images/background_button.png"
                border.left: 4 ; border.right: 4
                border.top: 4 ; border.bottom: 4
            }
        }
    }


    Button {
        id: change_language
        anchors.bottom: logInScreen.bottom
        width: logInScreen.width
        height: 30
        style: ButtonStyle {
            label: Text {
                text: "Change Language"
                font.pixelSize: 20
                font.family: "Raleway-Light"
                color: "#ffffff"
                smooth: true
                opacity: 1
                horizontalAlignment: Text.Center
                //anchors.horizontalCenter: change_language.horizontalCenter
            }
            background: BorderImage {
                source: control.pressed ? "qrc:/images/background_button_pressed.png" : "qrc:/images/background_button.png"
                border.left: 4 ; border.right: 4
                border.top: 4 ; border.bottom: 4
            }
        }
    }
}
