import QtQuick 2.0
import QtQuick.Layouts 1.15
import "qrc:/components"

Item {
    id: root

    GridLayout{
        id: options
        readonly property int optionWidth: 150;
        onParentChanged: () => console.error('resized');
        columns: Math.max(Math.floor(parent.width / optionWidth), 1)
        rows: Math.max(Math.ceil(children.length / columns), 1)
        rowSpacing: 20

           Option {
               option_text: "another test"
               bg_color: "green"
            }


           Option {
                option_text: "test"
                bg_color: "red"
           }


           Option {
                option_text: "some test text"
            }

           Option {
               option_text: "another test"
               bg_color: "green"
            }


           Option {
                option_text: "test"
                bg_color: "red"
           }


           Option {
                option_text: "some test text"
            }

           Option {
               option_text: "another test"
               bg_color: "green"
            }


           Option {
                option_text: "test"
                bg_color: "red"
           }


           Option {
                option_text: "some test text"
            }
    }
}

