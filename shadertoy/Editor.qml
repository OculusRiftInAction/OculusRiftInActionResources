import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Item {
    id: editRoot
    width: 1280
    height: 720
    signal channelSelect(var msg)

    Row {
        anchors.fill: parent
        id: row1
        spacing: 8
        anchors.margins: 8

        Column {
            id: column1
            width: childrenRect.width
            height: parent.height
            spacing: 8
            anchors.margins: 8
            Image {
                id: channel0
                height: 128
                width: 128
                MouseArea {
                    anchors.fill: parent
                    onClicked: editRoot.channelSelect(0);
                }
            }


            Image {
                id: channel1
                height: 128
                width: 128
                MouseArea {
                    anchors.fill: parent
                    onClicked: editRoot.channelSelect(1);
                }
            }

            Image {
                id: channel2
                height: 128
                width: 128
                MouseArea {
                    anchors.fill: parent
                    onClicked: editRoot.channelSelect(2);
                }
            }

            Image {
                id: channel3
                height: 128
                width: 128
                MouseArea {
                    anchors.fill: parent
                    onClicked: editRoot.channelSelect(3);
                }
            }
        }

        TextEdit {
            id: textEdit1
            text: qsTr("Text Edit")
            anchors.left: column1.right
            anchors.leftMargin: 8
            anchors.right: column3.left
            anchors.rightMargin: 0

            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            font.pixelSize: 12
        }

        Grid {
            columns: 3
            anchors.margins: 8
            id: column3
            width: 196
            height: parent.height
            spacing: 8
            anchors.right: parent.right
            anchors.rightMargin: 0
            Text { text: "Three"; font.bold: true; }
            Text { text: "words"; color: "red" }
            Text { text: "in"; font.underline: true }
            Text { text: "a"; font.pixelSize: 20 }
            Text { text: "row"; font.strikeout: true }
        }
    }
}




