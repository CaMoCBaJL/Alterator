import QtQuick 2.15

Rectangle {
    id: description
    height: description_text.height
    width: description_text.width

    Text {
        id: description_text
        text: 'some description text, may be reeeeeeeeeeeeeeeeeeeealy big'
    }
}

