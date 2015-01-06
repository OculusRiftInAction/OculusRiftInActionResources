import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Item {
    id: root
    width: 1280
    height: 720
    signal qmlSignal(string msg)

    Column {
        visible: true
        spacing: 8
        anchors.fill: parent
        anchors.margins: 8

        Row {
            width: parent.width
            Text {
                text: qsTr("Textures")
                width: 196
            }

            Column {
                id: column1
                width: parent.width
                spacing: 8

                Row {
                    width: 1280
                    spacing: 8

                    Image {
                        id: tex0
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }


                    Image {
                        id: tex1
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex2
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex3
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex4
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }


                    Image {
                        id: tex5
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex6
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex7
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }
                }

                Row {
                    id: row1
                    width: parent.width
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    spacing: 8
                    Image {
                        id: tex8
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex9
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex10
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex11
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex12
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex13
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex14
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: tex15
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }
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
                font.pixelSize: 12
                width: 72
            }
            Column {
                width: parent.width
                spacing: 8

                Row {
                    width: 1280
                    spacing: 8

                    Image {
                        id: cube0
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }


                    Image {
                        id: cube1
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube2
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube3
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube4
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }


                    Image {
                        id: cube5
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube6
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube7
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }
                }

                Row {
                    id: row2
                    width: parent.width
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    spacing: 8
                    Image {
                        id: cube8
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube9
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube10
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube11
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube12
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube13
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube14
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }

                    Image {
                        id: cube15
                        height: 128
                        width: 128
                        source: "image://resources/shadertoy/textures/tex00.jpg"
                        MouseArea {
                            anchors.fill: parent
                        }
                    }
                }
            }
        }
    }
}




