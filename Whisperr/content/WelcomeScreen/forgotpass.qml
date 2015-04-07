import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.1

Item {
    anchors.fill: parent
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

    Text {
        id: log_in_header
        text: "FORGOT PASSWORD"
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

    Text {
        id: fpguide
        text: "To reset your password
enter the email address you use to sign in to
Whisperr."
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.height * 0.025
        anchors.top: log_in_header.bottom
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: log_in_header.horizontalCenter
        color: "#fff"

    }

    TextField {
        style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    border.color: "#fff"
                    border.width: 0
                    radius: 3
                }
        }
        id: emailad
        width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
        placeholderText: "Email Address"
        anchors.top: fpguide.bottom
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: parent.height * 0.03
        height: parent.height * 0.1
    }

    Rectangle {
        id: slbutton
        color: "#fc6500"
        radius: 8
        anchors.top: emailad.bottom
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: parent.horizontalCenter
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
        text: "RESET"
        font.pixelSize: parent.height * 0.025
        font.family: "Raleway-Regular"
        color: "#ffffff"
        smooth: true
        anchors.top: slbutton.top
        anchors.horizontalCenter: slbutton.horizontalCenter
        anchors.topMargin: parent.height * 0.02
        opacity: 1
    }

    Text {
        id: create_new_account_
        text: "Already have an Account? Log In"
        font.pixelSize: parent.height * 0.03
        font.family: "Raleway-Light"
        color: "#ffffff"
        smooth: true
        anchors.bottom: change_language__.bottom
        anchors.horizontalCenter: parent.horizontalCenter
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
        id: change_language__
        text: "Change Language"
        font.pixelSize: parent.height * 0.03
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

