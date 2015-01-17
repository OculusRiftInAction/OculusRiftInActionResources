import QtQuick 2.3

TextEdit {
    FontLoader { id: tronFont; source: "fonts/uifont.ttf" }
    font.family: tronFont.name
    color: "white"
    font.pointSize: 14
    font.bold: true
}

