import QtQuick 2.15
import QtQuick.Controls 2.15
import fileio 1.0

ListView{
    id: options
    width: parent.width
    height: parent.height


    IOHelper{
        id: helper
    }

    Component.onCompleted:{
        helper.getFilesFromDir('/usr/share/aclocal').forEach(file =>
            listModel.append({option_text: file, bg_color: "green"}));
    }

    model: ListModel{
        id: listModel
        property string option_text
        property string bg_color
    }

    delegate: Option {
        option_text: model.option_text
        bg_color: model.bg_color
    }
}


