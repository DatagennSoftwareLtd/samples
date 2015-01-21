#include "mainmenumodel.h"
#include "menuitem.h"

MainMenuModel::MainMenuModel(QObject *parent) : QObject(parent)
{
    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Vibrate"));
    _list.last()->setValue(QStringLiteral("On"));

    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Missed Calls"));
    _list.last()->setValue(QStringLiteral("On"));

    _list.append(new MenuItem());
    _list.last()->setName(QStringLiteral("Voicemail"));
    _list.last()->setValue(QStringLiteral("On"));
}

MainMenuModel::~MainMenuModel()
{

}

