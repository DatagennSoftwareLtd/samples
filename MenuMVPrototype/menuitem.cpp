#include "menuitem.h"

MenuItem::MenuItem(QObject *parent)
  : QObject(parent)
  , _name("")
  , _value("")
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

