import QtQuick 2.15
Item {
    id: root

    Rectangle {
        id: description
        height: description_text.height
        width: description_text.width
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.right
        anchors.leftMargin: 20

        Text {
            id: description_text
            text: 'some description text, may be reeeeeeeeeeeeeeeeeeeealy big'
        }
    }
}

