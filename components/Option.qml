import QtQuick 2.0
import "qrc:/styles/main_page_styles.js" as BoxStyles

Item{
    id: root
    width: text_item.width
    height: text_item.height
    property string bg_color
    property string option_text
    property int text_width

    Rectangle {
        id: container
        color: '#ffffff'
        anchors.fill: parent
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: () => container.color = root.bg_color
            onExited: () => container.color = '#ffffff'
        Text {
            id: text_item
            color: '#333FFF'
            text: root.option_text
        }
        }
    }

    Component.onCompleted: () => text_width = root.width
}
