#include "contactsmodel.h"
#include "contactitem.h"

ContactsModel::ContactsModel(QObject *parent) : QObject(parent)
{
    _list.append(new ContactItem());
    _list.last()->setName(QStringLiteral("buddy1"));
    _list.last()->setUri(QStringLiteral("buddy1@sip.whisperr.com"));

    _list.append(new ContactItem());
    _list.last()->setName(QStringLiteral("buddy2"));
    _list.last()->setUri(QStringLiteral("buddy2@sip.whisperr.com"));
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

void ContactsModel::deleteContact(QString name)
{

}
