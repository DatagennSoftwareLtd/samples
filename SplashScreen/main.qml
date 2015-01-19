import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

ApplicationWindow {
    title: "SplashScreen"
    id: mainWindow
    width: 320
    height: 480
    visible: true

    SplashScreen{
        id:splashScreen
        imageSource: "splashscreen.png"
        anchors.fill: parent
        onSplashScreenCompleted: {
            // do whatever you want splash screen loaded completely
            console.log("Splash Screen Loaded");
        }
    }

    Text{
        text: "Main Form"
        anchors.centerIn: parent
    }

/*
    property var splashWindow: Splash {
           onTimeout: controlWindow.visible = true
       }
       */
}
