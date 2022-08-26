#include "headers/dbus_interface.h"
#include "headers/dbus_qml_connector.h"
#include <QXmlStreamReader>

namespace DBusLib {
    DBusInterface::DBusInterface(QObject *parent) : QQmlComponent(parent){
        QQmlPropertyMap * t = new QQmlPropertyMap(this);
        properties = new DBusPropertyMap(t, t);
    }

    DBusPropertyMap* DBusInterface::getProperties(){return properties;}
    QString DBusInterface::getInterfaceName(){return m_interface;}
    QString DBusInterface::getAddress(){return m_address;}
    DBusLib::BusType DBusInterface::getBusType(){return m_busType;}
    QString DBusInterface::getServiceName(){return  m_service;}

    void DBusInterface::setServiceName(QString service){
        m_service = service;
    }

    void DBusInterface::setInterfaceName(QString interface){
        m_interface = interface;
    }

    void DBusInterface::setAddress(QString address){
        m_address = address;
    }

    void DBusInterface::setBusType(int type){
        m_busType = static_cast<DBusLib::BusType>(type);
    }

    void DBusInterface::propertyUpdatedFromDBus(QDBusMessage mess){
        QString interface = mess.arguments()[0].toString();
        QVariantMap changedProperties = qdbus_cast<QVariantMap>( mess.arguments()[1].value<QDBusArgument>() );
        QStringList invalidProperties = mess.arguments()[2].toStringList();
        if (interface != DBusInterface::getInterfaceName()){
            return;
        }
        QMapIterator<QString, QVariant> i(changedProperties);
        while(i.hasNext()){
            i.next();
            properties->insert(i.key(), i.value());
        }

        QListIterator<QString> j(invalidProperties);
        while(j.hasNext()){
            properties->clear(j.next());
        }

        emit(propertiesChanged(properties));
    }

    QDBusConnection DBusInterface::getConnectionType(){
        return m_busType == DBusLib::BusType::Session ?
                    QDBusConnection::sessionBus() :
                    QDBusConnection::systemBus();
    }

    bool DBusInterface::updateDBus(QString key, QVariant val){
        auto t = key.toLocal8Bit();
        QDBusInterface props(m_service, m_address,
                               "org.freedesktop.DBus.Properties",
                               getConnectionType(), this);
        QDBusMessage ans = props.call("Set", getInterfaceName(), key, val);
        if(ans.type() == QDBusMessage::ErrorMessage){
            return false;
        }else{
            return true;
        }
    }

    void DBusInterface::parseDBusInterfaceData(){
        dBusInterface = new QDBusInterface(
                    m_service, m_address, m_interface,
                    getConnectionType(), this);

        //TODO: Create normal logging system
        if(dBusInterface->isValid()){
            initialLog.append("connected to D-Bus interface " + m_interface);
        }else{
            initialLog.append("There is no such service \"" + m_service +
                              "\", with adress \"" + m_address + "\" and interface\" " +
                              m_interface + "\" on " +
                              (DBusLib::ENUM_TO_STR(m_busType)).c_str());
            return;
        }

        QDBusInterface props(m_service, m_address,
                               "org.freedesktop.DBus.Introspectable",
                               getConnectionType(), this);

        QStringList propertyNames;
        QString raw = props.call("Introspect").arguments()[0].toString();


        //get prop names
        QXmlStreamReader xml(raw);
        //TODO: try with regex later
        while (!xml.atEnd()) {
            if (!xml.readNextStartElement())
                continue;
            if (xml.name() == QLatin1String("node"))
                continue;
            bool skip = false;
            if (xml.name() != QLatin1String("interface")) {
                skip = true;
            } else {
                skip = xml.attributes().value(QLatin1String("name")) != m_interface;
            }
            if (skip) {
                xml.skipCurrentElement();
                continue;
            }
            while (!xml.atEnd()) {
                if (!xml.readNextStartElement())
                    break;
                if (xml.name() == QLatin1String("property"))
                    propertyNames.append(xml.attributes().value(QStringLiteral("name")).toString());
                xml.skipCurrentElement();
            }
        }

        //get prop values by their names
        for(int i = 0; i < propertyNames.size(); i++){
            auto t = propertyNames[i].toLocal8Bit();
            properties->insert(
                        propertyNames[i],
                        dBusInterface->property(t.data()));
        }

        //TODO:Logging
        QDBusConnection connection = m_busType == DBusLib::BusType::Session ?
                          QDBusConnection::sessionBus() :
                          QDBusConnection::systemBus();

        connection.connect(
                    m_service, m_address, "org.freedesktop.DBus.Properties"
                    , "PropertiesChanged", this
                    , SLOT(propertyUpdatedFromDBus()));
    }

    QVariant DBusInterface::callDBusMethod(QString method, QVariantList args){
        QDBusMessage ans = dBusInterface->callWithArgumentList(QDBus::Block, method, args);
        if(ans.type() == QDBusMessage::ErrorMessage){
            logSignal("There is no such method \"" + method +
                      "\" with given arguments in interface \"" + m_interface+ "\"");
            return QVariant();
        }else{
            logSignal("Succesfuly called method \"" + method + "\"");
            qCritical() << ans.arguments();
            return QVariant(ans.arguments());
        }
    }

    void DBusInterface::onCompleted(){
        for(int i = 0; i < initialLog.size(); i++){
            emit logSignal(initialLog[i]);
        }
    }

    void DBusInterface::dbusConnect(QString signalOnDBus, QString slotInQML){
        const QMetaObject *const meta = metaObject();
        int border = staticMetaObject.methodCount();
        auto t1 = meta->method(30).methodSignature();
        auto t = slotInQML.toLocal8Bit();
        int methodIndex = meta->indexOfMethod(QMetaObject::normalizedSignature(t));
        if (methodIndex < border){
            return;
        }
        QMetaMethod method = meta->method(methodIndex);
        DBusQMLConnector *connector = new DBusQMLConnector(this);
        QDBusConnection connection = m_busType == DBusLib::BusType::Session ?
                    QDBusConnection::sessionBus() :
                    QDBusConnection::systemBus();

        if(connection.connect(
                    m_service, m_address, m_interface, signalOnDBus, connector,
                    SLOT(in(QDBusMessage))))
        {
            logSignal("Connected signal \"" + signalOnDBus +
                      "\" to slot \"" + slotInQML + "\"");
        }else{
            logSignal("There is no such method \"" + signalOnDBus +
                      "\" with given arguments in interface \"" + m_interface + "\"");
        }

        const QMetaObject *const connMeta = connector->metaObject();
        connect(connector, connMeta->method(connMeta->indexOfMethod("out(QVariant)")), this, method);
    }
}
