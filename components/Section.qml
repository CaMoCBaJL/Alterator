import QtQuick 2.0
import QtQuick.Layouts 1.15
import "qrc:/components/Section"
import fileio 1.0
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator
import "qrc:/styles/main_page_styles.js" as Styles

Rectangle {
    id: root

    Image {
        id: image
        source: "qrc:/images/1.png"
        fillMode: Image.Tile
        anchors.top: parent.top
        anchors.topMargin: Styles.image__top_margin
    }

    Column{
        height: parent.height
        width: parent.width * Styles.option_flow__width_modifier
        anchors.left: image.right
        anchors.leftMargin: Styles.elem__margin
        anchors.top: parent.top
        anchors.topMargin: Styles.elem__margin
        spacing: Styles.option__spacing

        SectionHeader{
            text: 'some section naming text'
        }

        SectionDescription{
            text: 'some description text, may be reeeeeeeeeeeeeeeeeeeealy big'
        }

        SectionOptionFlow{

        }
    }
}
