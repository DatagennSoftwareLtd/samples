#include "contactitem.h"

ContactItem::ContactItem(QObject *parent)
  : QObject(parent)
  , _name("")
  , _uri("")
{

}

ContactItem::~ContactItem()
{

}

void ContactItem::setName(const QString &n)
{
    if(_name == n)
        return;
    _name = n;
    emit nameChanged(n);
}

void ContactItem::setUri(const QString &u)
{
    if(_uri == u)
        return;
    _uri = u;
    emit uriChanged(u);
}
