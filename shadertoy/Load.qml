import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import Qt.labs.folderlistmodel 1.0


Item {
    id: loadRoot
    width: 1280
    height: 720
    signal channelSelect(var msg)

    Component {
        id: highlight
        Rectangle {
            width: 256 - 24; height: 40
            color: "slategray"; radius: 5
//            Behavior on y {
//                SpringAnimation {
//                    spring: 3
//                    damping: 0.2
//                }
//            }
        }
    }

    CustomBorder {
        width: 256
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: buttonRow.top
        anchors.bottomMargin: 8

        ListView {
            id: presets
            anchors.rightMargin: 12
            anchors.leftMargin: 12
            anchors.bottomMargin: 12
            anchors.topMargin: 12
            anchors.fill: parent
            highlight: highlight
            highlightFollowsCurrentItem: true
            focus: true
            delegate: CustomText {
                text: modelData
                MouseArea {
                    z: 1
                    anchors.fill: parent
                    onClicked: {
                        presets.currentIndex = index
                        userShaders.currentIndex = -1;
                    }
                    onDoubleClicked: {
                        root.loadPreset(presets.currentIndex)
                        root.setUiMode("edit");
                    }
                }
            }
            model: presetsModel
        }
    }

    CustomBorder {
        width: 256
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: buttonRow.top
        anchors.bottomMargin: 8

        FolderListModel {
            id: userPresetsModel
            objectName: "userPresetsModel"
            showDotAndDotDot : true
            nameFilters : ["*.xml", "*.json"]
            folder:  userPresetsFolder
        }

        ListView {
            clip: true
            id: userShaders
            anchors.rightMargin: 12
            anchors.leftMargin: 12
            anchors.bottomMargin: 12
            anchors.topMargin: 12
            anchors.fill: parent
            highlight: highlight
            highlightFollowsCurrentItem: true
            focus: true
            model: userPresetsModel
            delegate: CustomText {
                text: fileName
                MouseArea {
                    z: 1
                    anchors.fill: parent
                    onClicked: {
                        userShaders.currentIndex = index
                        presets.currentIndex = -1;
                    }
                    onDoubleClicked: {
                        console.log("Current folder: " + userPresetsModel.folder);
                        var filePath = userPresetsModel.get(index, "filePath");
                        if (userPresetsModel.isFolder(index)) {
                            console.log("Current filepath: " + filePath);
                            root.newShaderFilepath(filePath);
                        } else {
                            root.loadShaderFile(filePath);
                            root.setUiMode("edit");
                       }
                    }
                }
            }

            onCurrentItemChanged: {
                if (userPresetsModel.isFolder(userShaders.currentIndex)) {
                    previewImage.source = ""
                } else {
                    var name = userPresetsModel.get(userShaders.currentIndex, "filePath");
                    root.newShaderHighlighted(name);
                }
            }

        }
    }

    Row {
        id: buttonRow
        height: 64
        layoutDirection: Qt.RightToLeft
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        spacing: 8
        anchors.margins: 8

        CustomButton {
            width: 192
            id: load
            text: qsTr("Load")
            onClicked: {
                if (presets.currentIndex != -1) {
                    root.loadPreset(presets.currentIndex)
                } else if (userShaders.currentIndex != -1) {
                    console.log(userPresetsModel.get(userShaders.currentIndex, "filePath"))
                    root.loadShaderFile(userPresetsModel.get(userShaders.currentIndex, "filePath"))
                }

                root.setUiMode("edit");
           }
        }

        CustomButton {
            id: cancel
            width: 192
            text: qsTr("Cancel")
            onClicked: {
                root.setUiMode("edit");
            }
        }
    }

    Image {
        id: previewImage
        objectName: "previewImage"
        x: 270
        y: 19
        width: 720
        height: 405
        anchors.horizontalCenter: parent.horizontalCenter
    }

}




