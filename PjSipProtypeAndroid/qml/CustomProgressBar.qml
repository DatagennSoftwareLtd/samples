import QtQuick 2.0

Item {
    id: progressBar
    property int maxValue: 100 // Default maximum value
    property int currentValue: 0
    height: 50
    // The background rectangle of the progress bar
    Rectangle {
        height: 40
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.5; color: "gray" }
            GradientStop { position: 1.0; color: "transparent" }
        }
    }
    // The actual progressing bar
    Rectangle {
        width: {
            if (currentValue <= maxValue) {
                return parent.width * (currentValue / maxValue)
            }
            return parent.width
        }
        height: 40
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.5; color: "white" }
            GradientStop { position: 1.0; color: "transparent" }
        }
        Behavior on width { SmoothedAnimation { } }
    }
}
