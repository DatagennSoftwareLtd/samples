#ifndef DBPROVIDER_H
#define DBPROVIDER_H

#include <QObject>

class DbProvider : public QObject
{
    Q_OBJECT
public:
    explicit DbProvider(QObject *parent = 0);
    ~DbProvider();

signals:

public slots:
};

#endif // DBPROVIDER_H
