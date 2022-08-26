import QtQuick 2.15
import QtQuick.Window 2.15
import DBusInterface 1.0

Item{
    id: root
    property string interfaceName
    property string serviceName
    property string addressName
    property int busType
    property variant data

    DBusWrapper{
        id: dBusInterface
        interfaceName: root.interfaceName
        serviceName: root.serviceName
        address: root.addressName
        busType: root.busType

        Component.onCompleted: {
            dBusInterface.parseDBusInterfaceData();
            root.data = dBusInterface.properties
        }
    }
}
