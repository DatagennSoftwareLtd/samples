#ifndef CONTACTSMODEL_H
#define CONTACTSMODEL_H

#include <QObject>
#include <QtQuick>

class ContactItem;

class ContactsModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<ContactItem> list READ list  NOTIFY listChanged /*CONSTANT*/)

public:
    explicit ContactsModel(QObject *parent = 0);
    ~ContactsModel();

    QQmlListProperty<ContactItem> list()
    {
        return QQmlListProperty<ContactItem>(this, _list);
    }

    Q_INVOKABLE void addContact(QString name, QString uri);
    Q_INVOKABLE void deleteContact(QString name);

signals:
    void listChanged(QList<ContactItem*>);

public slots:

private:
    QList<ContactItem*> _list;
};

#endif // CONTACTSMODEL_H
