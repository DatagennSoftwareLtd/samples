#ifndef MESSAGEMODEL_H
#define MESSAGEMODEL_H

#include <QObject>
#include <QtQuick>

class MessageItem;
class DbProvider;

class MessageModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<MessageItem> list READ list  NOTIFY listChanged /*CONSTANT*/)

public:
    explicit MessageModel(DbProvider* db, QObject *parent = 0);
    ~MessageModel();

    QQmlListProperty<MessageItem> list()
    {
        return QQmlListProperty<MessageItem>(this, _list);
    }

    Q_INVOKABLE void deleteMessage();
    Q_INVOKABLE void clearAllLogs();
    Q_INVOKABLE void loadLogs();

    void readMessagesFromDB();
    void readMessagesFromDBbyContact();

    void setDbProvider(DbProvider* db) { dbProvider = db; }

signals:
    void listChanged(QList<MessageItem*>);

public slots:
    Q_INVOKABLE void addMessage(
                        const QString& name,
                        const QString& direction,
                        const QString& message,
                        const QString& type);

    Q_INVOKABLE void updateModel(const QString& account);

private:
    QList<MessageItem*> _list;
    DbProvider* dbProvider;
};

#endif // CONTACTSMODEL_H
