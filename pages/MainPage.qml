import QtQuick 2.0
import QtQuick.Layouts 1.15
import "qrc:/components"
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator

ColumnLayout{
    function sectionCount(){
        return 0;
    }

    id: root
    spacing: 20
    height: 1
    width: 2

    Section {
        height: parent.height * 0.6
        width: parent.width
    }

    Component.onCompleted: {
        for(let i = 0; i < sectionCount(); i++){
            DynamicObjectCreator.createObject("qrc:/components/Section.qml",
                                              root,
                                              {height: root.height /sectionCount(), width: root.width});
        }

    }
}
