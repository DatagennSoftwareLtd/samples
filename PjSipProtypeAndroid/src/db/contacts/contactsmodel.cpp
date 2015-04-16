#include "contactsmodel.h"
#include "contactitem.h"
#include "../provider/dbprovider.h"

#include <QDebug>

ContactsModel::ContactsModel(DbProvider* db, QObject *parent)
    : QObject(parent)
    , dbProvider(db)
{
    //dbProvider->fillContactsList(&_list);
}

ContactsModel::~ContactsModel()
{

}

void ContactsModel::addContact(QString name, QString uri)
{
    _list.append(new ContactItem());
    _list.last()->setName(name);
    _list.last()->setUri(uri);

    emit listChanged(_list);
}

void ContactsModel::updateModel(const QString& account)
{
    /*foreach (AccountItem* item, _list)
    {
        delete item;
    }*/
    _list.clear();
    dbProvider->fillContactsList(account, &_list);
    emit listChanged(_list);

    qDebug() << "ContactsModel::updateModel";
}

void ContactsModel::deleteContact(QString name)
{

}
