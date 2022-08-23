import QtQuick 2.15

Rectangle{
    id: header
    height: header_text.height
    width: header_text.width
    property string text

    Text {
        id: header_text
        text: header.text
    }
}
