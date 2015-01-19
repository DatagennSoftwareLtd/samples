import QtQuick 2.0

Item {
    id: splashScreenContainer

    // image source is kept as an property alias, so that it can be set from outside
    property alias imageSource: splashImage.source

    // signal emits when splashscreen animation completes
    signal splashScreenCompleted()

    Image {
        id: splashImage
        source: imageSource
        anchors.fill: splashScreenContainer // do specify the size and position
    }

    // simple QML animation to give a good user experience
    SequentialAnimation {
        id:splashanimation
        PauseAnimation { duration: 2200 }
        PropertyAnimation {
            target: splashImage
            duration: 700
            properties: "opacity"
            to:0
        }
        Component.onCompleted: {
            splashScreenContainer.splashScreenCompleted()
        }
    }
    //starts the splashScreen
    Component.onCompleted: splashanimation.start()
 }
