import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

import "../CustomItems"

BorderImage {
    id: footer
    border.top: 8
    source: "qrc:/images/footer/footerbar.png"

    signal cameraButtonClicked()
    signal microphoneButtonClicked()
    signal emoticonButtonClicked()

    readonly property real btnSz: footer.height*0.8

    WhisperrToolButton{
        id: cameraButton
        height: btnSz
        width: btnSz
        anchors.left: parent.left
        anchors.leftMargin: 5
        iconSource: "qrc:/images/footer/camera.png"
        Connections {
            target: cameraButton
            onClicked: footer.cameraButtonClicked()
        }
    }

    WhisperrToolButton{
        id: emoticonButton
        height: btnSz
        width: btnSz
        anchors.left: cameraButton.right
        anchors.leftMargin: 5
        iconSource: "qrc:/images/footer/emoticon.png"
        Connections {
            target: emoticonButton
            onClicked: footer.emoticonButtonClicked()
        }

    }

    Image {
       id: textbox
       anchors.left: emoticonButton.right
       anchors.leftMargin: footer.height * 0.2
       anchors.right: microphoneButton.left
       anchors.rightMargin:  footer.height * 0.2
       anchors.bottom: footer.bottom
       anchors.bottomMargin: footer.height * 0.15
       height: footer.height * 0.2
       source: "qrc:/images/footer/text_box.png"
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
       font.pixelSize: footer.height*0.4///0.075 * 0.03
       height: footer.height * 0.65
    }


    WhisperrToolButton{
        id: microphoneButton
        height: btnSz
        width: btnSz
        anchors.right: footer.right
        anchors.leftMargin: 5
        iconSource: "qrc:/images/footer/microphone.png"
        Connections {
            target: microphoneButton
            onClicked: footer.microphoneButtonClicked()
        }
    }
}
