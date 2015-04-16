#include "messageitem.h"

MessageItem::MessageItem(QObject *parent)
  : QObject(parent)
  , _messageId(0)
  , _name("")
  , _picture("")
  , _date("")
  , _time("")
  , _direction("")
  , _message("")
  , _type("")
{

}

MessageItem::~MessageItem()
{

}

void MessageItem::setMessageId(const messageID32 &id)
{
    if(_messageId == id)
        return;
    _messageId = id;
    emit messageIdChanged(id);
}

void MessageItem::setName(const QString &str)
{
    if(_name == str)
        return;
    _name = str;
    emit nameChanged(str);
}

void MessageItem::setPicture(const QString &str)
{
    if(_picture == str)
        return;
    _picture = str;
    emit pictureChanged(str);
}

void MessageItem::setDate(const QString &str)
{
    if(_date == str)
        return;
    _date = str;
    emit dateChanged(str);
}

void MessageItem::setTime(const QString &str)
{
    if(_time == str)
        return;
    _time = str;
    emit timeChanged(str);
}

void MessageItem::setDirection(const QString &str)
{
    if(_direction == str)
        return;
    _direction = str;
    emit directionChanged(str);
}

void MessageItem::setMessage(const QString &str)
{
    if(_message == str)
        return;
    _message = str;
    emit messageChanged(str);
}

void MessageItem::setType(const QString &str)
{
    if(_type == str)
        return;
    _type = str;
    emit typeChanged(str);
}

