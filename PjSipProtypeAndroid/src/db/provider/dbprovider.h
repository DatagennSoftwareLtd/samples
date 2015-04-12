#ifndef DBPROVIDER_H
#define DBPROVIDER_H

#include <QObject>
#include <QtQuick>

class ContactItem;
class AccountItem;

class DbProvider : public QObject
{
    Q_OBJECT
public:
    explicit DbProvider(QObject *parent = 0);
    ~DbProvider();

    Q_INVOKABLE void create();
    Q_INVOKABLE void open();
    Q_INVOKABLE void close();
    Q_INVOKABLE void remove();

    // fill models from tables
    void fillAccountsList(QList<AccountItem*>* list);
    void fillContactsList(const QString& account, QList<ContactItem*>* list);


    Q_INVOKABLE void addUse(const QString& account, const QString& server,
                            const QString& user, const QString& password);

    // add new account
    Q_INVOKABLE void addAccount(const QString& account, const QString& server,
                       const QString& user, const QString& password);

    // change account
    Q_INVOKABLE void changeAccount(const QString& account, const QString& server,
                       const QString& user, const QString& password,
                       const QString& newaccount, const QString& newserver,
                       const QString& newuser, const QString& newpassword);

    // delete account
    Q_INVOKABLE void deleteAccount(const QString& account, const QString& server,
                       const QString& user, const QString& password);

    // add new contact
    Q_INVOKABLE void addContact(const QString& account, const QString& buddy, const QString& uri);

    // change contact
    Q_INVOKABLE void changeContact(const QString& account,
                                const QString& buddy, const QString& uri,
                                const QString& newbuddy, const QString& newuri);

    // delete account
    Q_INVOKABLE void deleteContact(const QString& account, const QString& buddy, const QString& uri);


    void createAccountTable();
    void createContactListTable();

protected:


signals:
    void accountsTableChanged();
    void contactsTableChanged(const QString& account);

public slots:
};

#endif // DBPROVIDER_H
