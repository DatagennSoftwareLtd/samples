#include "accountsmodel.h"
#include "accountitem.h"

AccountsModel::AccountsModel(QObject *parent) : QObject(parent)
{
    _list.append(new AccountItem());
    _list.last()->setName(QStringLiteral("device1"));
    _list.last()->setUser(QStringLiteral("device1u"));
    _list.last()->setPassword(QStringLiteral("device1p"));

    _list.append(new AccountItem());
    _list.last()->setName(QStringLiteral("device2"));
    _list.last()->setUser(QStringLiteral("device2u"));
    _list.last()->setPassword(QStringLiteral("device2p"));
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

void AccountsModel::deleteAccount(QString account)
{

}
