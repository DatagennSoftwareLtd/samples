#ifndef CONTACTSMODEL_H
#define CONTACTSMODEL_H

#include <QObject>
#include <QtQuick>

class ContactItem;
class DbProvider;

class ContactsModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<ContactItem> list READ list  NOTIFY listChanged /*CONSTANT*/)

public:
    explicit ContactsModel(DbProvider* db, QObject *parent = 0);
    ~ContactsModel();

    QQmlListProperty<ContactItem> list()
    {
        return QQmlListProperty<ContactItem>(this, _list);
    }

    Q_INVOKABLE void addContact(QString name, QString uri);
    Q_INVOKABLE void deleteContact(QString name);

    void setDbProvider(DbProvider* db) { dbProvider = db; }

signals:
    void listChanged(QList<ContactItem*>);

public slots:
    Q_INVOKABLE void updateModel(const QString& account);

private:
    QList<ContactItem*> _list;
    DbProvider* dbProvider;
};

#endif // CONTACTSMODEL_H
