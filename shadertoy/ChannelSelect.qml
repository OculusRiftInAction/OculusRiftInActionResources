import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Item {
    id: channelRoot
    width: 1280
    height: 720
    Column {
        visible: true
        spacing: 8
        anchors.fill: parent
        anchors.margins: 8

        Row {
            Text {
                text: qsTr("Textures")
                width: 186
            }

            Column {
                spacing: 8
                Row {
                    spacing: 8
                    TextureIcon { path: "shadertoy/textures/tex00.jpg" }
                    TextureIcon { path: "shadertoy/textures/tex01.jpg" }
                    TextureIcon { path: "shadertoy/textures/tex02.jpg" }
                    TextureIcon { path: "shadertoy/textures/tex03.jpg" }
                    TextureIcon { path: "shadertoy/textures/tex04.jpg" }
                    TextureIcon { path: "shadertoy/textures/tex05.jpg" }
                    TextureIcon { path: "shadertoy/textures/tex06.jpg" }
                    TextureIcon { path: "shadertoy/textures/tex07.jpg" }
                }
                Row {
                    spacing: 8
                    TextureIcon { path: "shadertoy/textures/tex08.jpg" }
                    TextureIcon { path: "shadertoy/textures/tex09.jpg" }
                    TextureIcon { path: "shadertoy/textures/tex10.png" }
                    TextureIcon { path: "shadertoy/textures/tex11.png" }
                    TextureIcon { path: "shadertoy/textures/tex12.png" }
                    TextureIcon { path: "shadertoy/textures/tex14.png" }
                    TextureIcon { path: "shadertoy/textures/tex15.png" }
                    TextureIcon { path: "shadertoy/textures/tex16.png" }
                }
            }
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "#7f7f7f"
        }

        Row {
            Text {
                text: qsTr("Cubemaps")
                width: 186
            }
            Column {
                spacing: 8
                Row {
                    spacing: 8
                    TextureIcon { channelType: 1; path: "shadertoy/cubemaps/cube00_0.jpg" }
                    TextureIcon { channelType: 1; path: "shadertoy/cubemaps/cube01_0.png" }
                    TextureIcon { channelType: 1; path: "shadertoy/cubemaps/cube02_0.jpg" }
                    TextureIcon { channelType: 1; path: "shadertoy/cubemaps/cube03_0.png" }
                    TextureIcon { channelType: 1; path: "shadertoy/cubemaps/cube04_0.png" }
                    TextureIcon { channelType: 1; path: "shadertoy/cubemaps/cube05_0.png" }
                }
            }
        }
    }

    Button {
        id: cancel
        text: qsTr("Cancel")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        onClicked: {
            channelSelect.visible = false;
            editor.visible = true;
       }
    }
}




