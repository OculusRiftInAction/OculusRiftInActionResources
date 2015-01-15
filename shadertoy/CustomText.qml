import QtQuick 2.3

Text {
    FontLoader { id: tronFont; source: "fonts/uifont.ttf" }
    font.family: tronFont.name
    color: "white"
    text: "Text"
    font.pointSize: 14
    font.bold: true
}

