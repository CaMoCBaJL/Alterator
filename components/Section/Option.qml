import QtQuick 2.0
import "qrc:/styles/main_page_styles.js" as BoxStyles
Rectangle {
    id: container
    property string bg_color
    property string option_text
    height: text_item.height
    width: text_item.width

    MouseArea {
        hoverEnabled: true
        onEntered: () => container.color = bg_color
        onExited: () => container.color = '#ffffff'
        anchors.fill: parent

        Text {
            id: text_item
            color: '#333FFF'
            text: option_text
            wrapMode: Qt.TextWrapAnywhere

        }
    }
}



