import QtQuick 2.15
import QtQuick.Controls 2.15
import fileio 1.0
import "qrc:/scripts/CreateObject.js" as DynamicObjectCreator
import "qrc:/styles/main_page_styles.js" as Styles

ScrollView{
    width: parent.width

    clip: true
    ScrollBar.vertical.policy: ScrollBar.AlwaysOn
    contentHeight: 400

    Flow{
        id: options
        spacing: Styles.option__spacing
        anchors.fill: parent
//        height: parent.height
//        width: parent.width

        IOHelper{
            id: helper
        }

        Component.onCompleted:{
            for (let file of helper.getFilesFromDir('/usr/share/aclocal')){
                DynamicObjectCreator.createObject('qrc:/components/Section/Option.qml',
                                                  options,
                                                  {option_text: file, bg_color: "green"});
            }

            console.warn(options.children.length);
        }
    }
}


