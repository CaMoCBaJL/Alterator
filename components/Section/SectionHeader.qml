import QtQuick 2.15

Item {
    id: root

    Rectangle{
        id: header
        height: header_text.height
        width: header_text.width
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.right
        anchors.leftMargin: 20

        Text {
            id: header_text
            text: 'some section naming text'
        }
    }
}
