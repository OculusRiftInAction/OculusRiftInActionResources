import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Rectangle {
    id: editRoot
    width: 1280
    height: 720
    color: "#00000000"
    property alias text: shaderTextEdit.text
    function setChannelIcon(channel, path) {
        var channelItem;
        switch(channel) {
        case 0:
            channelItem = channel0;
            break;
        case 1:
            channelItem = channel1;
            break;
        case 2:
            channelItem = channel2;
            break;
        case 3:
            channelItem = channel3;
            break;
        }
        if (channelItem) {
            channelItem.source = path;
        }
    }

    Column {
        id: channelColumn
        width: childrenRect.width
        anchors.bottom: buttonArea.top
        anchors.bottomMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        spacing: 8
        anchors.margins: 8

        BorderImage {
            source: "tron_black_bg_no_corners.sci"
            height: 128 + 24
            width: 128 + 24
            Image {
                id: channel0
                objectName: "channel0"
                anchors.centerIn: parent
                height: 128
                width: 128
                source: "image://resources/shadertoy/tex_none.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: root.channelSelect(0);
            }
        }

        BorderImage {
            source: "tron_black_bg_no_corners.sci"
            height: 128 + 24
            width: 128 + 24
            Image {
                id: channel1
                objectName: "channel1"
                anchors.centerIn: parent
                height: 128
                width: 128
                source: "image://resources/shadertoy/tex_none.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: root.channelSelect(1);
            }
        }

        CustomBorder {
            height: 128 + 24
            width: 128 + 24
            Image {
                id: channel2
                objectName: "channel2"
                anchors.centerIn: parent
                height: 128
                width: 128
                source: "image://resources/shadertoy/tex_none.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: root.channelSelect(2);
            }
        }

        CustomBorder {
            height: 128 + 24
            width: 128 + 24
            Image {
                id: channel3
                objectName: "channel3"
                anchors.left: parent.left
                anchors.leftMargin: 12
                anchors.top: parent.top
                anchors.topMargin: 12
                height: 128
                width: 128
                source: "image://resources/shadertoy/tex_none.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: root.channelSelect(3);
            }
        }
    }


    CustomBorder {
        id: textFrame
        anchors.bottom: buttonArea.top
        anchors.bottomMargin: 8
        anchors.left: channelColumn.right
        anchors.leftMargin: 8
        anchors.right: infoColumn.left
        anchors.rightMargin: 8

        anchors.top: parent.top
        anchors.topMargin: 8
        TextArea {
            id: shaderTextEdit
            objectName: "shaderTextEdit"
            style: TextAreaStyle {
                backgroundColor: "#00000000"
                textColor: "white"
            }
            font.family: "Lucida Console"
            text: qsTr("Text Edit")
            anchors.rightMargin: 12
            anchors.leftMargin: 12
            anchors.bottomMargin: 12
            anchors.topMargin: 12
            font.pixelSize: 14
            anchors.fill: parent
            anchors.margins: 25
            focus: true
            wrapMode: TextEdit.NoWrap
            frameVisible: false
        }
    }

    BorderImage {
        source: "tron_black_bg_no_corners.sci"
        id: infoColumn
        width: 196
        height: 256
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        Grid {
            anchors.fill: parent
            anchors.margins: 16
            columns: 2
            spacing: 12
            CustomText { text: "FPS"; } CustomText { objectName: "fps"; text: "0" }
            CustomText { text: "RES"; } CustomText { objectName: "res"; text: "0" }
            CustomText { text: "EPS"; } CustomText { objectName: "eps"; text: "0" }
            CustomText { text: "EPF";  } Switch {
                objectName: "epf";
                onCheckedChanged: root.epfModeChanged(checked);
            }
            // CustomText { text: "MP";  } CustomText { objectName: "mp"; text: "0" }
        }
    }

    Rectangle {
        id: buttonArea
        color: "#00000000"
        height: 64
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.left: textFrame.left
        anchors.leftMargin: 0
        anchors.right: textFrame.right
        anchors.rightMargin: 0
        Row {
            height: parent.height
            anchors.right: parent.right
            spacing: 8
            layoutDirection: Qt.RightToLeft
            CustomButton {
                id: load
                height: parent.height
                text: qsTr("Load")
                onClicked: {
                    editor.visible = false;
                    loader.visible = true;
               }
            }
            CustomButton {
                id: save
                height: parent.height
                text: qsTr("Save")
                onClicked: {
                    editor.visible = false;
                    saver.visible = true;
               }
            }
        }
        Row {
            height: parent.height
            anchors.left: parent.left
            spacing: 8

            CustomButton {
                id: run
                height: parent.height
                text: qsTr("Run")
                onClicked: shaderSourceChanged(shaderTextEdit.text);
            }
        }
    }



}




