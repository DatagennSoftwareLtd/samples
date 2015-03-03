#ifndef ACCOUNTSMODEL_H
#define ACCOUNTSMODEL_H

#include <QObject>
#include <QtQuick>

class AccountItem;
class DbProvider;

class AccountsModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<AccountItem> list READ list NOTIFY listChanged /*CONSTANT*/)

public:
    explicit AccountsModel(DbProvider* db, QObject *parent = 0);
    ~AccountsModel();

    QQmlListProperty<AccountItem> list()
    {
        return QQmlListProperty<AccountItem>(this, _list);
    }

    Q_INVOKABLE void addAccount(QString account, QString user, QString password);
    Q_INVOKABLE void deleteAccount(QString account);

    void setDbProvider(DbProvider* db) { dbProvider = db; }

signals:
    void listChanged(QList<AccountItem*>);

public slots:
    void updateModel();

private:
    QList<AccountItem*> _list;
    DbProvider* dbProvider;
};

#endif // ACCOUNTSMODEL_H
