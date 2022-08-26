#ifndef DBUS_PROPERTY_MAP_H
#define DBUS_PROPERTY_MAP_H
#include <QQmlPropertyMap>

namespace DBusLib{
class DBusPropertyMap : public QQmlPropertyMap{
    Q_OBJECT
public:
    DBusPropertyMap(QQmlPropertyMap *derived, QObject *parent);

    QVariant updateValue(const QString &key, const QVariant &input);
signals:
    void updateDBusS(QString key, QVariant input);
};
}
#endif // DBUS_PROPERTY_MAP_H
