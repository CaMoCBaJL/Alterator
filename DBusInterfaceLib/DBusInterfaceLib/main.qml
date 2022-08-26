import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow{
    width: 600
    height: 600

    DbusInterface{
        interfaceName: 'org.freedesktop.hostname1'
        addressName: '/org/freedesktop/hostname1'
        serviceName: 'org.freedesktop.hostname1'
        busType: 2
    }
}
