import QtQuick 2.15
import QtQuick.Controls 2.15
import fileio 1.0
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator
import "qrc:/styles/styles.js" as Styles

ScrollView{
    width: parent.width
    height: parent.height * Styles.option_flow__height_modifier

    clip: true
    ScrollBar.vertical.policy: ScrollBar.AlwaysOn
    contentHeight: parent.height

    Flow{
        id: options
        spacing: Styles.option__spacing
        anchors.fill: parent

        IOHelper{
            id: helper
        }

        //TODO: remove mock dir with files for IOHelper
        //TODO: change IOHelper logic
        Component.onCompleted:{
            for (let file of helper.getFilesFromDir('/usr/share/aclocal')){
                DynamicObjectCreator.createObject('qrc:/components/Section/Option.qml',
                                                  options,
                                                  {option_text: file, bg_color: Styles.option__on_hover});
            }
        }
    }

    ScrollBar{}
}


