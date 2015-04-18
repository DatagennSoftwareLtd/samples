import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

Rectangle {
   id: messagesTab

   Rectangle{
       id: buddyRect
       width: parent.width
       height: 40
       anchors.top: parent.top

       Text {
           id: buddyText
           text: "buddy uri:"
           font.bold: true
           font.pointSize: 16
           height: buddyRect.height
           anchors.left: buddyRect.left
           anchors.margins: 5
       }

       Item {
           property alias text: buddyInput.text
           width: 180; height: buddyRect.height
           anchors.right: buddyRect.right
           BorderImage {
               source: "qrc:/images/lineedit.sci"
               anchors.fill: parent
           }
           TextInput {
               id: buddyInput
               text: sipua.buddy
               color: "#151515"; selectionColor: "green"
               font.pixelSize:14; font.bold: true
               width: parent.width-16
               anchors.centerIn: parent
               //focus: true
               onEditingFinished: {
                   sipua.buddy = text;
                   console.log(text);
               }
           }
       }
   }

   Rectangle{
       id: imRect
       width: parent.width
       height: 40
       anchors.top: buddyRect.bottom

       Text {
           id: imText
           text: "IM text:"
           font.bold: true
           font.pointSize: 16
           height: imRect.height
           anchors.left: imRect.left
           anchors.margins: 5
       }

       Item {
           property alias text: imInput.text
           width: 180; height: imRect.height
           anchors.right: imRect.right
           BorderImage {
               source: "qrc:/images/lineedit.sci"
               anchors.fill: parent
           }
           TextInput {
               id: imInput
               text: "hello buddy"
               color: "#151515"; selectionColor: "green"
               font.pixelSize:14; font.bold: true
               width: parent.width-16
               anchors.centerIn: parent
               //focus: true
               onEditingFinished: {
                   //sipua.buddy = text;
                   console.log(text);
               }
           }
       }
   }

   Rectangle{
       id: sendButton
       anchors.top: imRect.bottom
       width: parent.width
       height: 40
       color: mouse.pressed ? "steelblue" : "lightsteelblue"
       scale: mouse.pressed ? 0.98 : 1.0
       Text{
           text: "Send IM"
           anchors.centerIn: parent
       }

       MouseArea{
           id: mouse
           anchors.fill: parent
           onClicked: {
               console.log("sendButton");
           }

       }
   }
   Rectangle{
       id: receiveButton
       anchors.top: sendButton.bottom
       width: parent.width
       height: 40
       color: mouse2.pressed ? "steelblue" : "lightsteelblue"
       scale: mouse2.pressed ? 0.98 : 1.0
       Text{
           text: "Receive IM(test)"
           anchors.centerIn: parent
       }

       MouseArea{
           id: mouse2
           anchors.fill: parent
           onClicked: {
               console.log("receiveButton");
           }

       }
   }


   // accounts model delegate
   Component {
      id: chatDelegate
      Item {
          width: parent.width; height: 120
          property var view: ListView.view
          property var isCurrent: ListView.isCurrentItem
          property variant account: model

          Rectangle {
              anchors.margins: 5
              anchors.fill: parent

              MouseArea {
                  anchors.fill: parent
                  onClicked: {
                      //view.currentIndex = model.index;
                      //contactsModel.updateModel(model.name);
                  }
              }
          }
      }
   }

   ListView {
       id: chatView
       width: parent.width;
       anchors.top: receiveButton.bottom
       anchors.bottom: parent.bottom
       highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
       highlightFollowsCurrentItem: true
       focus: true
       clip: true

       model: accountsModel.list
       delegate: accountDelegate

   }

}

