import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
//import QtQuick.Window 2.1

import QtQuick.Dialogs 1.2

Rectangle {
    id: background
    anchors.fill: parent
    color: "#e74710"

    signal login()

    Connections {
        target: facade
        onResponse: {
            if(retcode === 100)
            {
                background.login();
            }
            else
                messageDialog.show(qsTr(message));
        }
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("Whisperr error")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }

    ///////////////////////////////////////////////////////////
    /////////////////////// ANIMATIONS ///////////////////////
    /////////////////////////////////////////////////////////
/*
    PropertyAnimation {
        id: loginanimation
        target: loginscreen
        property: "scale"
        from: 0
        to: 1
        duration: 250
        easing.type: Easing.OutBack
    }

    PropertyAnimation {
        id: signupanimation
        target: signupscreen
        property: "scale"
        from: 0
        to: 1
        duration: 250
        easing.type: Easing.OutBack
    }

    PropertyAnimation {
        id: fpanimation
        target: fpscreen
        property: "scale"
        from: 0
        to: 1
        duration: 250
        easing.type: Easing.OutBack
    }
*/
    TabView {
        anchors.fill: parent
        tabPosition: Qt.BottomEdge

        Tab {
            title: "Log In"
            id: lgTab

            sourceComponent:
                LoginScreen {
                 id: loginscreen
                 anchors.fill: parent
                 color: "#e74710"

/*
                 PropertyAnimation {
                     id: animation1
                     target: loginscreen
                     property: "scale"
                    // from: 0
                    // to: 1
                     duration: 2500
                     easing.type: Easing.OutBack
                 }

                 states:
                    State { name: "lgTabActive"; when: lgTab.active

                    PropertyChanges {
                        target: loginscreen;
                        scale: 0.5
                       }
                    }
                    */
            }
        }
        Tab {
            title: "Sign Up"
            sourceComponent:
                SignupScreen {
                id: signupscreen
                anchors.fill: parent
                color: "#e74710"
            }
        }
        Tab {
            title: "Forgot Password"
            sourceComponent:
                FpScreen {
                id: fpscreen
                anchors.fill: parent
                color: "#e74710"
            }
        }


        style: TabViewStyle {
            frameOverlap: 1
            tab: Rectangle {
                color: styleData.selected ? "#ffb786" : "#e74710"
                border.width: 1
                border.color: "#fff"
                implicitWidth: (parent.control.width )/3//* 0.30
                implicitHeight: parent.control.width * 0.10//parent.height
                radius: 0

                Text {
                    anchors.centerIn: parent
                    text: styleData.title
                    color: "#fff"
                    font.pixelSize: parent.height * 0.30
                }

                //animation.start()

                PropertyAnimation {
                    id: animation
                    target: parent.control
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 250
                    easing.type: Easing.OutBack
                }
            }
        }
    }
}
