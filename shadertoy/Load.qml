import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Item {
    id: loadRoot
    width: 1280
    height: 720
    signal channelSelect(var msg)

    Row {
        id: buttonRow
        height: 48
        layoutDirection: Qt.RightToLeft
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        spacing: 8
        anchors.margins: 8

        Button {
            id: load
            text: qsTr("Load")
        }

        Button {
            id: cancel
            text: qsTr("Cancel")
        }
    }
}




