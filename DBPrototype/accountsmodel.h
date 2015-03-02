#ifndef ACCOUNTSMODEL_H
#define ACCOUNTSMODEL_H

#include <QObject>
#include <QtQuick>

class AccountItem;

class AccountsModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<AccountItem> list READ list NOTIFY listChanged /*CONSTANT*/)

public:
    explicit AccountsModel(QObject *parent = 0);
    ~AccountsModel();

    QQmlListProperty<AccountItem> list()
    {
        return QQmlListProperty<AccountItem>(this, _list);
    }

    Q_INVOKABLE void addAccount(QString account, QString user, QString password);
    Q_INVOKABLE void deleteAccount(QString account);

signals:
    void listChanged(QList<AccountItem*>);

public slots:

private:
    QList<AccountItem*> _list;
};

#endif // ACCOUNTSMODEL_H
