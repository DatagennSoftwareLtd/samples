import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.1

Item {

    anchors.fill: parent
    focus: true

    Rectangle {
        id: background
        width: parent.width
        height: parent.height
        x: 0
        y: 0
        color: "#e74710"
    }

    Flickable {
        anchors.fill: parent
        contentHeight: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.height + ( parent.height * 0.01) } else { parent.height * 2.5 } }
        /** contentWidth: { parent.width + (parent.width * 0.01) } **/

    Text {
        id: log_in_header
        text: "SIGN UP"
        font.pixelSize: parent.height * 0.04
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        anchors.top: rr_layer.bottom
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: rr_layer.horizontalCenter
        opacity: 1
    }
    Image {
        id: rr_layer
        source: "qrc:/images/welcomescreen/rr_layer.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.025
        width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.80 } else { parent.width * 0.50 } }
        height: parent.height * 0.20
        opacity: 1
    }

    Rectangle {
        id: facebook_background
        color: "#3b5999"
        anchors.top: log_in_header.bottom
        anchors.topMargin: parent.height * 0.01
        anchors.horizontalCenter: log_in_header.horizontalCenter
        width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
        height: parent.height * 0.075
        radius: 5
        opacity: 1
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
        opacity: 1
    }

    Image {
        id: facebook_logo
        source: "qrc:/images/welcomescreen/facebook_logo.png"
        anchors.verticalCenter: facebook_background.verticalCenter
        anchors.left: facebook_background.left
        anchors.leftMargin: parent.width * 0.025
        width: facebook.height
        height: facebook.height
        opacity: 1
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
        id: emailad
        width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
        placeholderText: "Email Address"
        anchors.top: or.bottom
        anchors.horizontalCenter: facebook_background.horizontalCenter
        anchors.topMargin: parent.height * 0.025
        font.pixelSize: parent.height * 0.03
        height: parent.height * 0.10
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
        placeholderText: "Password"
        font.pixelSize: parent.height * 0.03
        anchors.top: emailad.bottom
        anchors.horizontalCenter: facebook_background.horizontalCenter
        anchors.topMargin: parent.height * 0.005
        width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
        height: parent.height * 0.10
    }

    Rectangle {
        id: slbutton
        color: "#fc6500"
        radius: 8
        anchors.top: password.bottom
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: facebook_background.horizontalCenter
        width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
        height: parent.height * 0.075
        opacity: 1
        MultiPointTouchArea {
            id: slbuttontouch
            anchors.fill: parent
            onPressed: { slbutton.color = "#ffb786"; slbuttonlight.color = "#ffb786" }
            onReleased: { slbutton.color = "#fc6500"; slbuttonlight.color = "#ff7e27" }
            onUpdated: { slbutton.color = "#fc6500"; slbuttonlight.color = "#ff7e27" }
        }

    }

    Rectangle {
        id: slbuttonlight
        color: "#ff7e27"
        radius: 8
        anchors.top: slbutton.top
        anchors.horizontalCenter: slbutton.horizontalCenter
        width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
        height: slbutton.height * 0.60
        opacity: 1
    }

    Text {
        id: log_in
        text: "SIGN UP"
        font.pixelSize: parent.height * 0.025
        font.family: "Raleway-Regular"
        color: "#ffffff"
        smooth: true
        anchors.top: slbutton.top
        anchors.horizontalCenter: slbutton.horizontalCenter
        anchors.topMargin: parent.height * 0.02
        opacity: 1
    }

    Rectangle {
        id: linkseparator
        color: "#fff"
        height: parent.height * 0.05
        width: 1
        anchors.bottom: change_language__.bottom
        anchors.bottomMargin: parent.height * 0.07
        anchors.horizontalCenter: slbutton.horizontalCenter
    }

    Text {
        id: create_new_account_
        text: "<< Go Back"
        font.pixelSize: parent.height * 0.030
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        anchors.bottom: change_language__.bottom
        anchors.right: linkseparator.left
        anchors.rightMargin: parent.width * 0.025
        anchors.bottomMargin: parent.height * 0.08
        opacity: 1
        MultiPointTouchArea {
                anchors.fill: parent
                onPressed: { create_new_account_.color = "#ffc974"; welcomescreen.source = "login.qml" }
                onReleased: create_new_account_.color = "#ffffff"
                onUpdated: create_new_account_.color = "#ffffff"
        }
    }
    Text {
        id: forgotten_password__
        text: "Forgot Password?"
        font.pixelSize: parent.height * 0.030
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        anchors.bottom: change_language__.bottom
        anchors.left: linkseparator.right
        anchors.leftMargin: parent.width * 0.025
        anchors.bottomMargin: parent.height * 0.08
        opacity: 1
        MultiPointTouchArea {
                anchors.fill: parent
                onPressed: { forgotten_password__.color = "#ffc974"; welcomescreen.source = "forgotpass.qml" }
                onReleased: forgotten_password__.color = "#ffffff"
                onUpdated: forgotten_password__.color = "#ffffff"
        }
    }
    Text {
        id: change_language__
        text: "Change Language"
        font.pixelSize: parent.height * 0.030
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: parent.height * 0.05
        opacity: 1
        MultiPointTouchArea {
                anchors.fill: parent
                onPressed: change_language__.color = "#ffc974"
                onReleased: change_language__.color = "#ffffff"
                onUpdated: change_language__.color = "#ffffff"
        }
    }
}
}
