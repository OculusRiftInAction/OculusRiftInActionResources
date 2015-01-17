import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Item {
    id: channelRoot
    width: 1280
    height: 720

    CustomBorder {
        id: textureGroup
        width: channelRoot.width
        height: 384 + 24 + 48
        anchors.top: parent.top
        anchors.topMargin: 0
        CustomText {
            id: labelTextures
            text: qsTr("Textures")
            anchors.top: texturesColumn.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 24
        }
        Column {
            id: texturesColumn
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            spacing: 16
            anchors.leftMargin: 256
            Row {
                spacing: 24
                TextureIcon { path: "textures/tex00.jpg" }
                TextureIcon { path: "textures/tex01.jpg" }
                TextureIcon { path: "textures/tex02.jpg" }
                TextureIcon { path: "textures/tex03.jpg" }
                TextureIcon { path: "textures/tex04.jpg" }
                TextureIcon { path: "textures/tex05.jpg" }
            }
            Row {
                spacing: 24
                TextureIcon { path: "textures/tex06.jpg" }
                TextureIcon { path: "textures/tex07.jpg" }
                TextureIcon { path: "textures/tex08.jpg" }
                TextureIcon { path: "textures/tex09.jpg" }
                TextureIcon { path: "textures/tex10.png" }
                TextureIcon { path: "textures/tex11.png" }
            }
            Row {
                spacing: 24
                TextureIcon { path: "textures/tex12.png" }
                TextureIcon { path: "textures/tex14.png" }
                TextureIcon { path: "textures/tex15.png" }
                TextureIcon { path: "textures/tex16.png" }
                CustomButton {
                    id: browse
                    width: 256 + 24
                    height: parent.height
                    text: qsTr("Browse")
                    enabled: false
                    onClicked: {
                    }
                }

            }
        }
    }

    CustomBorder {
        id: cubemapGroup
        width: channelRoot.width
        height: 128 + 48
        anchors.top: textureGroup.bottom
        anchors.topMargin: 8

        CustomText {
            id: labelCubemaps
            text: qsTr("Cubemaps")
            anchors.left: parent.left
            anchors.top: cubemapsRow.top
            anchors.topMargin: 0
            anchors.leftMargin: 24
        }
        Row {
            id: cubemapsRow
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            spacing: 24
            anchors.leftMargin: 256
            TextureIcon { channelType: 1; path: "cubemaps/cube00_0.jpg" }
            TextureIcon { channelType: 1; path: "cubemaps/cube01_0.png" }
            TextureIcon { channelType: 1; path: "cubemaps/cube02_0.jpg" }
            TextureIcon { channelType: 1; path: "cubemaps/cube03_0.png" }
            TextureIcon { channelType: 1; path: "cubemaps/cube04_0.png" }
            TextureIcon { channelType: 1; path: "cubemaps/cube05_0.png" }
        }
    }


    CustomButton {
        id: cancel
        width: 256
        text: qsTr("Cancel")
        anchors.top: cubemapGroup.bottom
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        onClicked: {
            root.setUiMode("edit");
        }
    }

}





