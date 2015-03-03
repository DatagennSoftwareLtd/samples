#include "accountsmodel.h"
#include "accountitem.h"
#include "dbprovider.h"

#include <QDebug>

AccountsModel::AccountsModel(DbProvider* db, QObject *parent)
    : QObject(parent)
    , dbProvider(db)
{
    dbProvider->fillAccountsList(&_list);
}

AccountsModel::~AccountsModel()
{

}

void AccountsModel::addAccount(QString account, QString user, QString password)
{
    _list.append(new AccountItem());
    _list.last()->setName(account);
    _list.last()->setUser(user);
    _list.last()->setPassword(password);

    emit listChanged(_list);
}

void AccountsModel::updateModel()
{
    /*foreach (AccountItem* item, _list)
    {
        delete item;
    }*/
    _list.clear();
    dbProvider->fillAccountsList(&_list);
    emit listChanged(_list);

    qDebug() << "ContactsModel::updateModel";
}

void AccountsModel::deleteAccount(QString account)
{

}
