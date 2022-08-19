import QtQuick 2.15
import QtQuick.Window 2.15
import "qrc:/pages"

Window {
    id: root
    width: 600
    height: 600
    visible: true
    title: qsTr("Hello World")

    MainPage{
        id: mainPage
        height: root.height * 0.6
        width: root.width
    }
}
