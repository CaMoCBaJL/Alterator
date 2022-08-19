import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle{
    id: image
    anchors.top: parent.top
    anchors.topMargin: 10
    anchors.left: parent.left
    anchors.leftMargin: 10

    Image {
        source: "qrc:/images/1.png"
        fillMode: Image.Stretch
    }
}
