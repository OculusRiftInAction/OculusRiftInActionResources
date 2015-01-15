import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Item {
    id: saveRoot
    width: 1280
    height: 720
    signal channelSelect(var msg)

    Rectangle {
        id: flashingblob
        width: 75; height: 75
        color: "blue"
        opacity: 1.0

        MouseArea {
            anchors.fill: parent
            onClicked: {
                animateColor.start()
                animateOpacity.start()
            }
        }

        PropertyAnimation {id: animateColor; target: flashingblob; properties: "color"; to: "green"; duration: 100}

        NumberAnimation {
            id: animateOpacity
            target: flashingblob
            properties: "opacity"
            from: 0.99
            to: 1.0
            loops: Animation.Infinite
            easing {type: Easing.OutBack; overshoot: 500}
       }
    }

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

        CustomButton {
            id: save
            text: qsTr("Save")
        }

        CustomButton {
            id: cancel
            text: qsTr("Cancel")
            onClicked: {
                editor.visible = true;
                saver.visible = false;
           }


        }
    }
}




