#include "accountitem.h"

AccountItem::AccountItem(QObject *parent)
  : QObject(parent)
  , _name("")
  , _user("")
  , _password("")
{

}

AccountItem::~AccountItem()
{

}

void AccountItem::setName(const QString &n)
{
    if(_name == n)
        return;
    _name = n;
    emit nameChanged(n);
}

void AccountItem::setUser(const QString &u)
{
    if(_user == u)
        return;
    _user = u;
    emit userChanged(u);
}

void AccountItem::setPassword(const QString &p)
{
    if(_password == p)
        return;
    _password = p;
    emit passwordChanged(p);
}

