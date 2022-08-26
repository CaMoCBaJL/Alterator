#include "headers/dbus_qml_connector.h"

namespace DBusLib{
DBusQMLConnector::DBusQMLConnector(QObject *parent) : QObject(parent){}

void DBusQMLConnector::in(QDBusMessage mess){
    emit out(QVariant(mess.arguments()));
}
}
