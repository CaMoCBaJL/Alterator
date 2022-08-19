import QtQuick 2.15

Rectangle{
    id: header
    height: header_text.height
    width: header_text.width

    Text {
        id: header_text
        text: 'some section naming text'
    }
}
