import QtQuick 2.0

Rectangle {
    id: splash

    anchors.fill: parent
    color: "black"

    property int minTimeout: 3000  // 3s by default.
    property string image;            // path to splash image
    property bool show: false       // if show is true then image opacity is 1.0, else 0.0

    property bool canFinish: false    // if true then we can hide spash after timeout

    state: show ? "showingSplash" : ""

    onStateChanged: {
        if( state == "showingSplash" )
            splashTimer.start();
    }

    opacity: 0.0

    Image {
        source: image
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        smooth: true
    }

    Timer {
        id: splashTimer
        interval: minTimeout
        running: false
        repeat:  true
        onTriggered: {
            if( splash.canFinish )
            {
                // finally we can stop timer and hide splash
                splash.show = false
                splashTimer.repeat = false
            }
            else
            {
                // canFinish is false, but main.qml is not loaded yet
                // we should run timer again and again
                splashTimer.interval = 1000 // 1 sec
                splashTimer.repeat = true
            }
        }
    }

    states: [
        State {
            name: "showingSplash"
            PropertyChanges { target: splash;  opacity: 1.0 }
        }
    ]

    // hide splash using animation
    transitions: [
        Transition {
            from: ""; to: "showingSplash"
            reversible: true
            PropertyAnimation { property: "opacity";  duration: 500; }
        }
    ]
}

