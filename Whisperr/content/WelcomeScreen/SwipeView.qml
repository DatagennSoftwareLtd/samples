import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

Item {
id: swipeView
property var model
property bool isDesktopPlatform: Qt.platform.os === "windows" ||
Qt.platform.os === "linux" ||
Qt.platform.os === "osx"

Rectangle {
    id: background
    width: parent.width
    height: parent.height
    x: 0
    y: 0
    color: "#e74710"
}

ColumnLayout {
anchors.fill: parent
spacing: 0

ListView {
id: headersListView
Layout.fillWidth: true
orientation: ListView.Horizontal
boundsBehavior: Flickable.StopAtBounds
model: swipeView.model
currentIndex: screensListView.currentIndex
delegate: Item {
width: headerLabel.width + headersListView.height * 0.4
anchors.top: parent.top
anchors.bottom: parent.bottom

MouseArea {
id: headerMouseArea
anchors.fill: parent
onClicked: screensListView.currentIndex = index
}
}
highlightFollowsCurrentItem: false
highlight: Item {
x: headersListView.currentItem.x
width: headersListView.currentItem.width
height: stripRectangle.height * 3
anchors.bottom: parent.bottom

Behavior on x {
NumberAnimation {
duration: 300
}
}

Behavior on width {
NumberAnimation {
duration: 300
}
}

Rectangle {
anchors.left: parent.left
anchors.right: parent.right
height: stripRectangle.height * 2
color: "#80c342"
}

Rectangle {
anchors.bottom: parent.bottom
anchors.left: parent.left
anchors.right: parent.right
height: stripRectangle.height
color: "#006325"
}
}

Rectangle {
id: stripRectangle
anchors.left: parent.left
anchors.right: parent.right
anchors.bottom: parent.bottom
height: parent.height * 0.05
z: -1
color: "lightgray"
}
}

ListView {
id: screensListView
Layout.fillWidth: true
Layout.fillHeight: true
orientation: ListView.Horizontal
snapMode: ListView.SnapOneItem
highlightRangeMode: ListView.StrictlyEnforceRange
highlightMoveVelocity: 2000
clip: true
model: swipeView.model
onCurrentItemChanged: {
if (isDesktopPlatform)
currentItem.item.selected()
}
delegate: Loader {
width: screensListView.width
height: screensListView.height
source: model.source

Component.onCompleted: {
item.isFirstScreen = (index === 0)
item.isLastScreen = (index === screensListView.count - 1)
}
}
}
}
}
