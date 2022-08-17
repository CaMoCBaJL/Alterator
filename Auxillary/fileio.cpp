#include "fileio.h"
#include <QDir>
#include <QRegExp>
#include <QDebug>

FileIO::FileIO(QObject *parent)
    : QObject{parent}
{

}

QStringList FileIO::getFilesFromDir(QString pathToDir)
{
    if (QRegExp ("*\.*", Qt::CaseInsensitive, QRegExp::PatternSyntax::RegExp).exactMatch(pathToDir))
    {
        return QStringList();
    }

    QStringList result;

    auto dirData = QDir(pathToDir).entryInfoList(QDir::Filter::Files);
    foreach (QFileInfo file, dirData)
    {
        result.append(file.fileName());
    }

    return result;
}
