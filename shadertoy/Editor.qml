import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Item {
    id: root
    width: 1280
    height: 720
    signal qmlSignal(string msg)

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
            Text {
                text: qsTr("Col1")
                width: 72
            }
        }

        Column {
            id: column2
            height: parent.height
            spacing: 8
            anchors.right: column3.left
            anchors.rightMargin: 0
            anchors.left: column1.right
            anchors.leftMargin: 0
            anchors.margins: 8
            Text {
                text: qsTr("Col2")
                width: 72
            }
        }

        Column {
            id: column3
            width: childrenRect.width
            height: parent.height
            spacing: 8
            anchors.right: parent.right
            anchors.rightMargin: 0
            Text {
                text: qsTr("Col3")
                width: 72
            }
        }
    }
}




