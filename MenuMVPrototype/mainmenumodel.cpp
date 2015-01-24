#include "mainmenumodel.h"
#include "menuitem.h"

MainMenuModel::MainMenuModel(QObject *parent) : QObject(parent)
{
    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Checker"));
    _list.last()->setValue(QStringLiteral("On"));
    _list.last()->setType(MenuItem::ItChecker);


    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Edit"));
    _list.last()->setValue(QStringLiteral("1234"));
    _list.last()->setType(MenuItem::ItEdit);

    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Button"));
    _list.last()->setValue(QStringLiteral(""));
    _list.last()->setType(MenuItem::ItButton);
}

MainMenuModel::~MainMenuModel()
{

}

