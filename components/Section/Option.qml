import QtQuick 2.0
import "qrc:/styles/styles.js" as Styles

Rectangle {
    id: container
    property string bg_color
    property string option_text
    height: text_item.height
    width: text_item.width
    radius: 10

    MouseArea {
        hoverEnabled: true
        onEntered: () => container.color = bg_color
        onExited: () => container.color = Styles.background
        anchors.fill: parent

        Text {
            id: text_item
            color: Styles.option_text__color
            text: option_text
            wrapMode: Qt.TextWrapAnywhere
        }
    }
}



