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
        anchors.margins: 4

        Row {
        	width: parent.width
            Text {
                text: qsTr("Textures")
                font.pixelSize: 12
                width: 72
            }
            
            Flow {
	        	width: parent.width
                spacing: 16
				Repeater {
     				model: 16
                    Image {
                     	id: tex
                        source: "image://res/tex/" + index
                        height: 128
                        width: 128
				        MouseArea {
				            anchors.fill: parent
							onClicked: root.qmlSignal("tex/" + index)
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

            Flow {
                spacing: 16
				Repeater {
     				model: 6
                    Image {
                        source: "image://res/cube/" + index
	                    height: 128
	                    width: 128
				        MouseArea {
				            anchors.fill: parent
							onClicked: root.qmlSignal("tex/" + index)
				        }
	                }
                }
            }
        }
    }
}




