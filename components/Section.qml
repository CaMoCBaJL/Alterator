import QtQuick 2.0
import QtQuick.Layouts 1.15
import "qrc:/components"
import fileio 1.0
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator

Item {
    id: root

    Rectangle{
        width: root.width
        height: root.height

        Rectangle{
            id: image
            height: root.height * 0.8
            width: root.width * 0.15

            Image {
                source: "qrc:/images/1.png"
                fillMode: Image.Stretch
                anchors.fill: parent
                sourceSize.width: parent.width
                sourceSize.height: parent.height
            }
        }

        Rectangle{
            id: header
            height: header_text.height
            width: header_text.width
            anchors.top: image.top
            anchors.topMargin: image.height * 0.2
            anchors.left: image.right
            anchors.leftMargin: image.width * 0.2

            Text {
                id: header_text
                text: 'some section naming text'
            }
        }

        Rectangle {
            id: description
            height: description_text.height
            width: description_text.width
            anchors.top: header.bottom
            anchors.topMargin: 10
            anchors.left: image.right
            anchors.leftMargin: image.width * 0.4

            Text {
                id: description_text
                text: 'some description text, may be reeeeeeeeeeeeeeeeeeeealy big'
            }
        }

        Rectangle {
            width: options.childrenRect.width
            height: options.childrenRect.height
            anchors.top: description.bottom
            anchors.topMargin: 10
            anchors.left: image.right
            anchors.leftMargin: image.width * 0.4

            GridLayout{
                id: options
                rowSpacing: 20
                columnSpacing: 20

                IOHelper{
                    id: helper
                }

                Component.onCompleted:{
                    for(let file of helper.getFilesFromDir('./')){
                        DynamicObjectCreator.createObject("qrc:/components/Section/Option.qml",
                                                          options,
                                                          {option_text: file, bg_color: "green"});
                    }
                }
            }
        }
    }
}
