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
            hoverEnabled: true
            onEntered: () => container.color = root.bg_color
            onExited: () => container.color = '#ffffff'
            anchors.fill: parent
            Text {
                id: text_item
                color: '#333FFF'
                text: root.option_text

                //check why it doesn't work
//                ColorAnimation {
//                    from: "#ffffff"
//                    to: "#333FFF"
//                    duration: 4000
//                }
            }
        }
    }

    Component.onCompleted: () => text_width = root.width

}
