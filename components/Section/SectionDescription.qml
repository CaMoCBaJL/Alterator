import QtQuick 2.15

Rectangle {
    id: description
    height: description_text.height
    width: description_text.width
    property string text

    Text {
        id: description_text
        text: description.text
    }
}

