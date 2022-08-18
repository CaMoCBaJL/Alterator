import QtQuick 2.15
import QtQuick.Layouts 1.15
import fileio 1.0
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator

Item {
    id: root

    Rectangle {
        width: options.childrenRect.width
        height: options.childrenRect.height
        anchors.top: parent.top
        anchors.topMargin: 80
        anchors.left: root.parent.parent.right
        anchors.leftMargin: 20

        GridLayout{
            id: options
            columnSpacing: 20
            rowSpacing: 10

            IOHelper{
                id: helper
            }

            Component.onCompleted:{
                for(let file of helper.getFilesFromDir('./')){
                    DynamicObjectCreator.createObject("qrc:/components/Section/Option.qml",
                                                      options,
                                                      {option_text: file, bg_color: "green"});
                }

                let summaryWidth = Object.keys(options.children).map(item => options.children[item]["text_width"]).reduce((prWidth, curWidth) => prWidth + curWidth);

                options.rows = Math.round(summaryWidth / parent.width);
                options.columns = Math.round(options.children.length / options.rows);
            }
        }
    }
}
