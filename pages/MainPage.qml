import QtQuick 2.0
import QtQuick.Layouts 1.15
import "qrc:/components"
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator
import fileio 1.0

Column{
    function sectionCount(){
        return 1;
    }

    id: root
    spacing: 20

    Component.onCompleted: {
        for(let i = 0; i < sectionCount(); i++){
            DynamicObjectCreator.createObject("qrc:/components/Section.qml",
                                              root, {});
        }

    }
}
