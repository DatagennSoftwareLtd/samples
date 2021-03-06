#include "messagemodel.h"
#include "messageitem.h"
#include "../provider/dbprovider.h"

#include <QDebug>
#include <QDateTime>

MessageModel::MessageModel(DbProvider* db, QObject *parent)
    : QObject(parent)
    , dbProvider(db)
{
}

MessageModel::~MessageModel()
{

}

void MessageModel::addMessage(const QString& name,
                              const QString& direction,
                              const QString& message,
                              const QString& type)
{
    MessageItem* item = new MessageItem();

    // fill item
    item->setMessageId(0); // TODO generate next ID
    item->setName(name);
    item->setPicture("NA");
    item->setMynumber("NA");
    QDateTime date = QDateTime::currentDateTime();
    item->setDate(date.toString("dd.MMM.yyyy"));
    item->setTime(date.toString("hh.mm.ss"));
    item->setDirection(direction);
    item->setMessage(message);
    item->setType(type);

    // add message 2 db
    dbProvider->addMessageInfo(item);

    // add message 2 list
    _list.push_back(item);
    qDebug() << "MessageModel::addMessage : " << item->name();

    emit listChanged(_list);
}

void MessageModel::deleteMessage()
{

}

void MessageModel::clearAllLogs()
{

}

void MessageModel::loadLogs()
{
    dbProvider->fillMessagesList(&_list);
    emit listChanged(_list);
}

void MessageModel::updateModel(const QString& account)
{
    /*foreach (AccountItem* item, _list)
    {
        delete item;
    }*/
    _list.clear();
    //dbProvider->fillContactsList(account, &_list);
    emit listChanged(_list);

    qDebug() << "MessageModel::updateModel";
}

void MessageModel::readMessagesFromDB()
{

}

void MessageModel::readMessagesFromDBbyContact()
{

}
