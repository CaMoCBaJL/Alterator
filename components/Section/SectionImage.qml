import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    Rectangle{
        id: image
        height: parent.height
        width: parent.width * 0.2
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.right
        anchors.leftMargin: 10

        Image {
            source: "qrc:/images/1.png"
            fillMode: Image.Stretch
        }
    }
}
