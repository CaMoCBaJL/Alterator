import QtQuick 2.0
import QtQuick.Layouts 1.15
import "qrc:/components"

Item{
    id:root

    ColumnLayout{
        id: sections
        spacing: 20

        Component.onCompleted: {
            for(let i = 0; i < 5; i++){
                let comp = Qt.createComponent("qrc:/components/Section.qml");

                if (comp.status === Component.Ready){
                    comp.createObject(sections, {height: root.height / 5, width: root.width})
                }
            }
        }
    }
}
