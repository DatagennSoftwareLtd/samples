#ifndef DBPROVIDER_H
#define DBPROVIDER_H

#include <QObject>
#include <QtQuick>

class DbProvider : public QObject
{
    Q_OBJECT
public:
    explicit DbProvider(QObject *parent = 0);
    ~DbProvider();

    Q_INVOKABLE void create();
    Q_INVOKABLE void open();
    Q_INVOKABLE void close();
    Q_INVOKABLE void remove();
    Q_INVOKABLE void addUse(const QString& account, const QString& server,
                            const QString& user, const QString& password);

    Q_INVOKABLE void addAccount(const QString& account, const QString& server,
                       const QString& user, const QString& password);

    Q_INVOKABLE void changeAccount(const QString& account, const QString& server,
                       const QString& user, const QString& password);

    Q_INVOKABLE void deleteAccount(const QString& account, const QString& server,
                       const QString& user, const QString& password);



protected:
    void createAccountTable();
    void createContactListTable();

signals:

public slots:
};

#endif // DBPROVIDER_H
