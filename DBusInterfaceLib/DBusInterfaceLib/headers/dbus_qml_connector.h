#ifndef DBUS_QML_CONNECTOR_H
#define DBUS_QML_CONNECTOR_H

#include <QObject>
#include <QtDBus/QDBusMessage>

namespace DBusLib{
class DBusQMLConnector : public QObject{
    Q_OBJECT
public:
    DBusQMLConnector(QObject *parent);
public slots:
    void in(QDBusMessage mess);
signals:
    void out(QVariant mess);
};
}

#endif // DBUS_QML_CONNECTOR_H
