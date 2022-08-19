import QtQuick 2.15
import QtQuick.Controls 2.15
import fileio 1.0
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator

Flow{
    id: options
    width: parent.width
    spacing: 5

    IOHelper{
        id: helper
    }

    Component.onCompleted:{
        for (let file of helper.getFilesFromDir('/usr/share/aclocal')){
            DynamicObjectCreator.createObject('qrc:/components/Section/Option.qml',
                                              options,
                                              {option_text: file, bg_color: "green"});
        }
    }
}


