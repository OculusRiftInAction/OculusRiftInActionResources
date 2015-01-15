import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtWinExtras 1.0

Item {
    id: loadRoot
    width: 1280
    height: 720
    signal channelSelect(var msg)

    Row {
        id: buttonRow
        height: 64
        layoutDirection: Qt.RightToLeft
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        spacing: 8
        anchors.margins: 8

        CustomButton {
            width: 192
            id: load
            text: qsTr("Load")
        }

        CustomButton {
            id: cancel
            width: 192
            text: qsTr("Cancel")
            onClicked: {
                editor.visible = true;
                loader.visible = false;
           }
        }
    }

    ListView {
        id: listView1
        x: 0
        y: 0
        width: 110
        height: 160
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                spacing: 10
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
    }
}




