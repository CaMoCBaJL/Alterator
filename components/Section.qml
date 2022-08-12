import QtQuick 2.0
import QtQuick.Layouts 1.15

Item {
    id: root
    property variant options

    RowLayout {
        Image {
            source: "qrc:/images/1.jpg"
            height: 50
            width: 50

            Component.onCompleted: {
                height = root.height / 2;
                width = root.width / 5;
            }
        }

        Text {

        }

        Text {

        }

//        OptionRow{

//        }
    }
}
