import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "qrc:/pages"
import fileio 1.0
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator

Window {
    id: root
    width: 600
    height: 600
    visible: true
    title: qsTr("Hello World")

    MainPage{
        height: parent.height
        width: parent.width
    }
}
