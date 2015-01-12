import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Rectangle {
    id: editRoot
    width: 1280
    height: 720
    color: "#7f000000"
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
            channelItem.source = "image://resources/" + path;
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

        Image {
            id: channel0
            objectName: "channel0"
            height: 128
            width: 128
            source: "image://resources/shadertoy/tex_none.png"
            MouseArea {
                anchors.fill: parent
                onClicked: root.channelSelect(0);
            }
        }


        Image {
            id: channel1
            objectName: "channel1"
            height: 128
            width: 128
            source: "image://resources/shadertoy/tex_none.png"
            MouseArea {
                anchors.fill: parent
                onClicked: root.channelSelect(1);
            }
        }

        Image {
            id: channel2
            objectName: "channel2"
            height: 128
            width: 128
            source: "image://resources/shadertoy/tex_none.png"
            MouseArea {
                anchors.fill: parent
                onClicked: root.channelSelect(2);
            }
        }

        Image {
            id: channel3
            objectName: "channel3"
            height: 128
            width: 128
            source: "image://resources/shadertoy/tex_none.png"
            MouseArea {
                anchors.fill: parent
                onClicked: root.channelSelect(3);
            }
        }
    }

    Rectangle {
        id: textFrame
        color: "#00000000"
        anchors.bottom: buttonArea.top
        anchors.bottomMargin: 8
        anchors.left: channelColumn.right
        anchors.leftMargin: 8
        anchors.right: infoColumn.left
        anchors.rightMargin: 8

        anchors.top: parent.top
        anchors.topMargin: 8

        BorderImage {
           source: "lineedit.sci"
           anchors.fill: parent
        }

        TextArea {
            id: shaderTextEdit
            style: TextAreaStyle {
                backgroundColor: "#afffffff"
            }
//            backgroundVisible:
            objectName: "shaderTextEdit"
            font.family: "Courier"
            text: qsTr("Text Edit")
            font.pixelSize: 14
            anchors.fill: parent
            anchors.margins: 10
            focus: true
            wrapMode: TextEdit.NoWrap
            frameVisible: false
       }
    }


    Grid {
        columns: 2
        id: infoColumn
        anchors.margins: 8
        width: 196
        anchors.bottom: buttonArea.top
        anchors.bottomMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        spacing: 12

        Text { text: "FPS"; } Text { objectName: "fps"; text: "0" }
        Text { text: "RES"; } Text { objectName: "res"; text: "0" }
        Text { text: "EPS"; } Text { objectName: "eps"; text: "0" }
        Text { text: "MP";  } Text { objectName: "mp"; text: "0" }
        Text { text: "EPF";  } Text { objectName: "epf"; text: "Off"; }
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
            Button {
                id: load
                height: parent.height
                text: qsTr("Load")
            }
            Button {
                id: save
                height: parent.height
                text: qsTr("Save")
            }
        }
        Row {
            height: parent.height
            anchors.left: parent.left
            spacing: 8

            Button {
                id: run
                height: parent.height
                text: qsTr("Run")
                onClicked: shaderSourceChanged(shaderTextEdit.text);
            }
        }
    }



}




