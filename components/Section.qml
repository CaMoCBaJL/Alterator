import QtQuick 2.0
import QtQuick.Layouts 1.15
import "qrc:/components/Section"
import fileio 1.0
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator

Rectangle {
    id: root

    SectionImage{
        id: image
    }

    ColumnLayout{
        anchors.left: parent.left
        anchors.leftMargin: image.width * 0.8 + 30
        anchors.top: parent.top
        anchors.topMargin: 10
        spacing: 10
        width: parent.width
        height: parent.height

        SectionHeader{

        }

        SectionDescription{

        }

        SectionOptionGrid{

        }
    }
}
