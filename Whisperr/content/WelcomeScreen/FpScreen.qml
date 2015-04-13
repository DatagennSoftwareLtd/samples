import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.1

Rectangle {
id: fpscreen
anchors.fill: parent
color: "#e74710"

Flickable {
    anchors.fill: parent
    //contentHeight: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.height + ( parent.height * 0.01) } else { parent.height * 2 } }

Text {
    id: fpheader
    text: "SIGN UP"
    font.pixelSize: parent.height * 0.04
    font.family: "Raleway-Light"
    color: "#ffffff"
    smooth: true
    anchors.top: fpwhisperr.bottom
    anchors.topMargin: parent.height * 0.025
    anchors.horizontalCenter: fpwhisperr.horizontalCenter
    opacity: 1
}

Image {
    id: fpwhisperr
    source: "qrc:/images/welcomescreen/rr_layer.png"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.topMargin: parent.height * 0.15
    //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.80 } else { parent.width * 0.50 } }
    width: parent.width * 0.80
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
    anchors.top: fpheader.bottom
    anchors.topMargin: parent.height * 0.025
    anchors.horizontalCenter: fpheader.horizontalCenter
    color: "#fff"

}

TextField {
    style: TextFieldStyle {
            textColor: "black"
            background: Rectangle {
                border.color: "#fff"
                border.width: 0
            }
    }
    id: fpemail
    //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
    width: parent.width * 0.90
    height: parent.height * 0.10
    placeholderText: "Email Address"
    anchors.top: fpguide.bottom
    anchors.horizontalCenter: fpguide.horizontalCenter
    anchors.topMargin: parent.height * 0.025
    font.pixelSize: parent.height * 0.03
}

Item {
    id: fpbutton
    anchors.top: fpemail.bottom
    anchors.topMargin: parent.height * 0.025
    anchors.horizontalCenter: fpheader.horizontalCenter
    //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
    width: parent.width * 0.90
    height: parent.height * 0.10

    Rectangle {
        id: fpbuttondark
        color: "#fc6500"
        radius: 8
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: parent.height * 0.75
        opacity: 1
    }

    Rectangle {
        id: fpbuttonlight
        color: "#ff7e27"
        radius: 8
        anchors.top: fpbuttondark.top
        anchors.horizontalCenter: fpbuttondark.horizontalCenter
        width: parent.width
        height: fpbuttondark.height * 0.50
        opacity: 1
    }

    Text {
        id: forgotpass
        text: "RESET"
        font.pixelSize: parent.height * 0.40
        font.family: "Raleway-Regular"
        color: "#ffffff"
        smooth: true
        anchors.top: fpbuttondark.top
        anchors.horizontalCenter: fpbuttondark.horizontalCenter
        anchors.topMargin: parent.height * 0.10
        opacity: 1
    }

    MouseArea{
    //MultiPointTouchArea {
        anchors.fill: parent
        onPressed: { fpbuttondark.color = "#ffb786"; fpbuttondark.color = "#ffb786" }
        onReleased: { fpbuttondark.color = "#fc6500"; fpbuttondark.color = "#ff7e27";
            //welcomescreen.source = "conversation.qml"
        }
        onClicked:
        {
            facade.resetPassword(fpemail.text, "en");
        }
    }

}
}
}
