import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQml.Models 2.15
import "qrc:/components"
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator
import fileio 1.0

ColumnLayout{
    function sectionCount(){
        return 5;
    }

    id: sections
    spacing: 20

    Component.onCompleted: {
        for(let i = 0; i < sectionCount(); i++){
            DynamicObjectCreator.createObject("qrc:/components/Section.qml",
                                              sections, {height: root.height / sectionCount()});
        }

    }
}

//ListView{
//        function sectionCount(){
//            return 5;
//        }

//    id: sections
//    anchors.top: parent.bottom
//    anchors.bottom: parent.bottom
//    anchors.left: parent.left
//    anchors.right: parent.right

//    delegate: Section {
//    }

//    model: ListModel{
//        id: listModel
//        property int height
//        property int width
//    }

//    Component.onCompleted: {
//        for (let i = 0; i < sectionCount(); i++){
//            listModel.append({height: parent.height / sectionCount(), width: parent.width});
//        }
//    }
//}

