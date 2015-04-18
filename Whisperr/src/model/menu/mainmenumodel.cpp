#include "mainmenumodel.h"
#include "menuitem.h"

MainMenuModel::MainMenuModel(QObject *parent) : QObject(parent)
{
    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Checker 1"));
    _list.last()->setValue(QStringLiteral("On"));
    _list.last()->setIconUrl("images/userDef.png");
    _list.last()->setType(MenuItem::ItChecker);

    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Checker 2"));
    _list.last()->setValue(QStringLiteral("On"));
    _list.last()->setIconUrl("images/userDef.png");
    _list.last()->setIconPos(MenuItem::IpRight);
    _list.last()->setType(MenuItem::ItChecker);

    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Checker 3"));
    _list.last()->setValue(QStringLiteral("On"));
    _list.last()->setType(MenuItem::ItChecker);


    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Edit"));
    _list.last()->setValue(QStringLiteral("1234"));
    _list.last()->setIconUrl("images/userDef.png");
    _list.last()->setType(MenuItem::ItEdit);

    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Edit"));
    _list.last()->setValue(QStringLiteral("1234"));
    _list.last()->setIconUrl("images/userDef.png");
    _list.last()->setIconPos(MenuItem::IpRight);
    _list.last()->setType(MenuItem::ItEdit);

    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Button"));
    _list.last()->setValue(QStringLiteral(""));
    _list.last()->setIconUrl("images/userDef.png");
    _list.last()->setType(MenuItem::ItButton);

    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Button"));
    _list.last()->setValue(QStringLiteral(""));
    _list.last()->setIconUrl("images/userDef.png");
    _list.last()->setIconPos(MenuItem::IpRight);
    _list.last()->setType(MenuItem::ItButton);
}

MainMenuModel::~MainMenuModel()
{

}

