import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Button {
    text: "Button"
    width: 128
    height: 64
    FontLoader { id: tronFont; source: "fonts/tron.ttf" }
    style: ButtonStyle {
        background:  BorderImage {
            anchors.fill: parent
           source: "tron_black_bg_no_corners.sci"
        }
        label: Text {
           renderType: Text.NativeRendering
           verticalAlignment: Text.AlignVCenter
           horizontalAlignment: Text.AlignHCenter
           font.family: tronFont.name
           color: "white"
           text: control.text
        }
    }
}



