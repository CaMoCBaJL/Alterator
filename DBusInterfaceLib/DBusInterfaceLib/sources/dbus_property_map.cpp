#include "headers/dbus_property_map.h"
#include "headers/dbus_interface.h"

namespace DBusLib{
DBusPropertyMap::DBusPropertyMap(QQmlPropertyMap *derived, QObject *parent) : QQmlPropertyMap(derived, parent){}

QVariant DBusPropertyMap::updateValue(const QString &key, const QVariant &input){
    emit(updateDBusS(key, input));
    auto t = parent();
    DBusInterface *iface = qobject_cast<DBusInterface *>(parent()->parent());
    if(iface->updateDBus(key, input)){
        return input;
    }else{
        return this->value(key);
    }
}
}
