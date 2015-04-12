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

    ////////////////////////////////////////////////////////////
    ////////////////////// LOG IN SCREEN //////////////////////
    //////////////////////////////////////////////////////////

    Item {
        id: loginscreen
        anchors.fill: parent
        visible: true

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
            opacity: 1
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
            opacity: 1
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
            //width: { if (Screen.primaryOrientation != Qt.LandscapeOrientation) { parent.width * 0.90 } else { parent.width * 0.60 } }
            width: parent.width * 0.90
            height: parent.height * 0.10

            Rectangle {
                id: slbutton
                color: "#fc6500"
                radius: 8
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                height: parent.height * 0.75
                opacity: 1
            }

            Rectangle {
                id: slbuttonlight
                color: "#ff7e27"
                radius: 8
                anchors.top: slbutton.top
                anchors.horizontalCenter: slbutton.horizontalCenter
                width: parent.width
                height: slbutton.height * 0.50
                opacity: 1
            }

            Text {
                id: log_in
                text: "LOG IN"
                font.pixelSize: parent.height * 0.40
                font.family: "Raleway-Regular"
                color: "#ffffff"
                smooth: true
                anchors.top: slbutton.top
                anchors.horizontalCenter: slbutton.horizontalCenter
                anchors.topMargin: parent.height * 0.10
                opacity: 1
            }

            MouseArea{
                anchors.fill: parent
                onPressed: { slbutton.color = "#ffb786"; slbuttonlight.color = "#ffb786" }
                onClicked:
                    facade.login(username.text, password.text, "en");
                onReleased: {
                    slbutton.color = "#fc6500";
                    slbuttonlight.color = "#ff7e27";
                    //background.login(); //loginWindow.login();
                    //facade.login(username.text, password.text, "en");

                    //welcomescreen.source = "conversation.qml";
                }
                /** onUpdated: { slbutton.color = "#fc6500"; slbuttonlight.color = "#ff7e27" } **/
               // onUpdated: { slbutton.color = "#fc6500"; slbuttonlight.color = "#ff7e27" }
            }
/*
            MultiPointTouchArea {
                id: slbuttontouch
                anchors.fill: parent
                onPressed: { slbutton.color = "#ffb786"; slbuttonlight.color = "#ffb786" }
                onReleased: {
                    slbutton.color = "#fc6500";
                    slbuttonlight.color = "#ff7e27";
                    //background.login(); //loginWindow.login();
                    //facade.login(username.text, password.text, "en");

                    //welcomescreen.source = "conversation.qml";
                }

                onUpdated: { slbutton.color = "#fc6500"; slbuttonlight.color = "#ff7e27" }
            }*/

        }
    }
    }

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


    ////////////////////////////////////////////////////////////
    ////////////////////// SIGNUP SCREEN //////////////////////
    //////////////////////////////////////////////////////////

    Item {
        id: signupscreen
        anchors.fill: parent
        visible: false

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
            width: facebook_background.width * 0.3
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
                /** onUpdated: { slbutton.color = "#fc6500"; slbuttonlight.color = "#ff7e27" } **/
                //onUpdated: { signupbutton.color = "#fc6500"; signupbutton.color = "#ff7e27" }
                onClicked:
                {
                    facade.signup(signupusername.text, signuppassword.text, "en");
                }
            }

        }
    }
    }

    ////////////////////////////////////////////////////////////
    ////////////////// FORGOT PASSWORD SCREEN /////////////////
    //////////////////////////////////////////////////////////

    Item {
        id: fpscreen
        anchors.fill: parent
        visible: false

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
                /** onUpdated: { slbutton.color = "#fc6500"; slbuttonlight.color = "#ff7e27" } **/
                //onUpdated: { fpbuttondark.color = "#fc6500"; fpbuttondark.color = "#ff7e27" }
                onClicked:
                {
                    facade.resetPassword(fpemail.text, "en");
                }
            }

        }
    }
    }

    ///////////////////////////////////////////////////////////
    ////////////////////// FOOTER LINKS //////////////////////
    /////////////////////////////////////////////////////////

    Rectangle {
        id: links
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height * 0.10
        color: "#e74710"

        Rectangle {
            id: linkseparator
            color: "#fff"
            height: 1
            width: parent.width
            anchors.top: parent.top
        }

        Rectangle {
            id: loginlink
            color: "#ffb786"
            width: parent.width * 0.25
            height: parent.height
            anchors.top: linkseparator.bottom
            state: "active"

            Text {
                text: "Log In"
                color: "#fff"
                font.pixelSize: parent.height * 0.30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Rectangle {
                color: "#fff"
                height: parent.height
                width: 1
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }

            MouseArea {
                anchors.fill: parent
                onPressed: { if (loginlink.state != "active") {
                        loginlink.color = "#ffb786"
                    }
                }
                onReleased: { if (loginlink.state != "active") {
                        if (signuplink.state == "active") {
                            loginscreen.visible = true
                            loginanimation.start()
                            loginlink.state = "active"
                            signuplink.color = "#00000000"
                            signuplink.state = "inactive"
                            signupscreen.visible = false
                        }
                        if (forgotpasslink.state == "active") {
                            loginscreen.visible = true
                            loginanimation.start()
                            loginlink.state = "active"
                            forgotpasslink.color = "#00000000"
                            forgotpasslink.state = "inactive"
                            fpscreen.visible = false
                        }
                    } else {
                        loginlink.color = "#ffb786"
                    }
                }
            }

        }

        Rectangle {
            id: signuplink
            color: "#00000000"
            width: parent.width * 0.25
            height: parent.height
            anchors.top: linkseparator.bottom
            anchors.right: parent.right
            state: "inactive"

            Text {
                text: "Sign Up"
                color: "#fff"
                font.pixelSize: parent.height * 0.30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Rectangle {
                color: "#fff"
                height: parent.height
                width: 1
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }

            MouseArea {
                anchors.fill: parent
                onPressed: { if (signuplink.state != "active") {
                        signuplink.color = "#ffb786"
                    }
                }
                onReleased: { if (signuplink.state != "active") {
                        if (loginlink.state == "active") {
                            signupscreen.visible = true
                            signupanimation.start()
                            signuplink.state = "active"
                            loginlink.color = "#00000000"
                            loginlink.state = "inactive"
                            loginscreen.visible = false
                        }
                        if (forgotpasslink.state == "active") {
                            signupscreen.visible = true
                            signupanimation.start()
                            signuplink.state = "active"
                            forgotpasslink.color = "#00000000"
                            forgotpasslink.state = "inactive"
                            fpscreen.visible = false
                        }
                    } else {
                        signuplink.color = "#ffb786"
                    }
                }
            }
        }

        Rectangle {
            id: forgotpasslink
            color: "#00000000"
            width: parent.width * 0.30
            height: parent.height
            anchors.top: linkseparator.bottom
            anchors.right: signuplink.left
            anchors.left:  loginlink.right
            state: "inactive"

            Text {
                text: "Forgot Password"
                color: "#fff"
                font.pixelSize: parent.height * 0.30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            MouseArea {
                anchors.fill: parent
                onPressed: { if (forgotpasslink.state != "active") {
                        forgotpasslink.color = "#ffb786"
                    }
                }
                onReleased: { if (forgotpasslink.state != "active") {
                        if (loginlink.state == "active") {
                            fpscreen.visible = true
                            fpanimation.start()
                            forgotpasslink.state = "active"
                            loginlink.color = "#00000000"
                            loginlink.state = "inactive"
                            loginscreen.visible = false
                        }
                        if (signuplink.state == "active") {
                            fpscreen.visible = true
                            fpanimation.start()
                            forgotpasslink.state = "active"
                            signuplink.color = "#00000000"
                            signuplink.state = "inactive"
                            signupscreen.visible = false
                        }
                    } else {
                        forgotpasslink.color = "#ffb786"
                    }
                }
            }
        }

    }

    ///////////////////////////////////////////////////////////
    /////////////////////// ANIMATIONS ///////////////////////
    /////////////////////////////////////////////////////////

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

/*
    Keys.onReleased:{

       if (event.key === Qt.Key_Menu)
       {
           console.log("popup");
       }

       console.log("1:" + event.key);
   }
*/
}
