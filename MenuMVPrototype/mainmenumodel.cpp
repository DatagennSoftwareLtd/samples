#include "mainmenumodel.h"

MainMenuModel::MainMenuModel(QObject *parent) : QObject(parent)
{
    _list.append(new MenuItem(/*QStringLiteral("name 1")*/));
    _list.last()->setName(QStringLiteral("item 1"));
    _list.append(new MenuItem(/*QStringLiteral("name 2")*/));
    _list.last()->setName(QStringLiteral("item 2"));
    _list.append(new MenuItem(/*QStringLiteral("name 3")*/));
    _list.last()->setName(QStringLiteral("item 3"));

    startTimer(5000);
}

MainMenuModel::~MainMenuModel()
{

}

