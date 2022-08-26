#ifndef NEW_INTERFACE_H
#define NEW_INTERFACE_H
#include <QObject>
#include <QtDBus/QDBusInterface>
#include <QtDBus/QDBusArgument>
#include <QQmlPropertyMap>
#include <QQmlComponent>
#include <QEvent>
#include "dbus_property_map.h"
#include <iostream>

namespace DBusLib{
using namespace std;
#define ENUM_TO_STR(ENUM) string(#ENUM)

enum BusType{
    Session,
    System
};

class DBusInterface: public QQmlComponent{
    Q_OBJECT

    Q_PROPERTY(QString serviceName
               WRITE setServiceName
               READ getServiceName)
    Q_PROPERTY(QString interfaceName
               WRITE setInterfaceName
               READ getInterfaceName)
    Q_PROPERTY(QString address
               WRITE setAddress
               READ getAddress)
    Q_PROPERTY(int busType
               WRITE setBusType
               READ getBusType)

    Q_PROPERTY(DBusPropertyMap* properties
               READ getProperties
               NOTIFY propertiesChanged)

public:
    DBusInterface(QObject *parent = 0);

    DBusPropertyMap* getProperties();

    QString getInterfaceName();
    QString getServiceName();
    QString getAddress();
    BusType getBusType();
    QDBusConnection getConnectionType();

    void setServiceName(QString service);
    void setInterfaceName(QString interface);
    void setAddress(QString address);
    void setBusType(int type);

    bool updateDBus(QString key, QVariant val);

    QVariant callDBusMethod(QString method, QVariantList args);
    Q_INVOKABLE void dbusConnect(QString signalOnDBus, QString signalInQML);
    Q_INVOKABLE void parseDBusInterfaceData();

public slots:
    void propertyUpdatedFromDBus(QDBusMessage mess);
    void onCompleted();

signals:
    void propertiesChanged(DBusPropertyMap *q);

    void logSignal(QString record);
    void completed();

private:
    QDBusInterface *dBusInterface;
    DBusPropertyMap *properties;
    QMap<QString, QMetaMethod> DBusSignals;
    QString m_interface;
    QString m_service;
    QString m_address;
    BusType m_busType;

    QStringList initialLog;
};
}

#endif // NEW_INTERFACE_H
