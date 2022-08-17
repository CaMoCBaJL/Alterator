import QtQuick 2.0
import QtQuick.Layouts 1.15
import "qrc:/components"
import fileio 1.0

Item {
    id: root

    Grid{
        Rectangle{
            id: image
            height: root.height * 0.8
            width: root.width * 0.2
            anchors.bottomMargin: 20

            Image {
                source: "qrc:/images/1.jpg"
                fillMode: Image.Stretch
                anchors.fill: parent
                sourceSize.width: parent.width
                sourceSize.height: parent.height
            }
        }

        Rectangle{
            id: header
            height: 40
            width: header_text.width + 20

            Text {
                id: header_text
                text: 'some section naming text'
            }
        }

        Rectangle {
            id: description
            height: 40
            width: description_text.width + 30

            Text {
                id: description_text
                text: 'some description text, may be reeeeeeeeeeeeeeeeeeeealy big'
            }
        }

        Flow{
            id: options
            spacing: 20
            width:

            IOHelper{
               id: helper
            }

            Component.onCompleted:{
               //add elements in collection during runtime
               for(let file of helper.getFilesFromDir('./')){
                    let comp = Qt.createComponent("qrc:/components/Option.qml");

                    if (comp.status === Component.Ready){
                        comp.createObject(options, {option_text: file, bg_color: "green"})
                    }
                }
            }
        }
    }
}
