#ifndef MESSAGEITEM_H
#define MESSAGEITEM_H

#include <QObject>
#include <QtQuick>
#include "../../model/whisperrstructures.h"

class MessageItem : public QObject
{
    Q_OBJECT

    Q_PROPERTY(messageID32 messageId READ messageId WRITE setMessageId NOTIFY messageIdChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString picture READ picture WRITE setPicture NOTIFY pictureChanged)
    Q_PROPERTY(QString date READ date WRITE setDate NOTIFY dateChanged)
    Q_PROPERTY(QString time READ time WRITE setTime NOTIFY timeChanged)
    Q_PROPERTY(QString direction READ direction WRITE setDirection NOTIFY directionChanged)
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)
    Q_PROPERTY(QString type READ type WRITE setType NOTIFY typeChanged)

public:

    explicit MessageItem(QObject *parent = 0);
    ~MessageItem();

    messageID32 messageId() const { return _messageId; }
    void setMessageId(const messageID32& id);

    QString name() const { return _name; }
    void setName(const QString &n);

    QString picture() const { return _picture; }
    void setPicture(const QString &str);

    QString date() const { return _date; }
    void setDate(const QString &str);

    QString time() const { return _time; }
    void setTime(const QString &str);

    QString direction() const { return _direction; }
    void setDirection(const QString &str);

    QString message() const { return _message; }
    void setMessage(const QString &str);

    QString type() const { return _type; }
    void setType(const QString &str);

signals:
    void messageIdChanged(const messageID32&);
    void nameChanged(const QString &str);
    void pictureChanged(const QString &str);
    void dateChanged(const QString &str);
    void timeChanged(const QString &str);
    void directionChanged(const QString &str);
    void messageChanged(const QString &str);
    void typeChanged(const QString &str);

private:
    messageID32 _messageId;
    QString _name ; // their name/group name,
    QString _picture; // their picture/group picture,
    QString _date;
    QString _time;
    QString _direction; //(in/out)
    QString _message;
    QString _type; //(conversation|group)
};

#endif // MESSAGEITEM_H
