#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QStringList>

class FileIO : public QObject
{
    Q_OBJECT
public:
    explicit FileIO(QObject *parent = nullptr);
    Q_INVOKABLE QStringList getFilesFromDir(QString path);
signals:

};

#endif // FILEIO_H
