import QtQuick 2.0
import QtQuick.Layouts 1.15
import "qrc:/components/Section"
import fileio 1.0
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator

Rectangle {
    id: root
    width: parent.width
    height: parent.height

    SectionImage{
        id: image
    }

    Column{
        height: parent.height
        width: parent.width - 20
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: image.width * 1.5
        anchors.top: parent.top
        anchors.topMargin: 10
        spacing: 10

        SectionHeader{

        }

        SectionDescription{

        }

        SectionOptionGrid{

        }
    }
}
