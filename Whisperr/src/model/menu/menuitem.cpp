#include "menuitem.h"

MenuItem::MenuItem(QObject *parent)
  : QObject(parent)
  , _name("")
  , _value("")
  , _iconUrl("")
  , _type(ItButton)
  , _iconPos(IpLeft)
{

}

MenuItem::~MenuItem()
{

}

void MenuItem::setName(const QString &n)
{
    if(_name == n)
        return;
    _name = n;
    emit nameChanged(n);
}

void MenuItem::setValue(const QString &v)
{
    if(_value == v)
        return;
    _value = v;
    emit valueChanged(v);
}

void MenuItem::setIconUrl(const QString &u)
{
    if(_iconUrl == u)
        return;
    _iconUrl = u;
    emit iconUrlChanged(u);
}

void MenuItem::setType(const int &t)
{
    if(_type == t)
        return;
    _type = (ItemType)t;
    emit typeChanged(t);
}

void MenuItem::setIconPos(const int &i)
{
    if(_iconPos == i)
        return;
    _iconPos = (IconPosition)i;
    emit iconPosChanged(i);
}

