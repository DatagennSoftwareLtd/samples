#ifndef DBPROVIDER_H
#define DBPROVIDER_H

#include <QObject>
#include <QtQuick>

class ContactItem;
class AccountItem;

class MessageItem;

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


    Q_INVOKABLE void addUse(const QString& account, const QString& server,
                            const QString& user, const QString& password);

    //-----------------------------------------------------------------
    // accounts
    //-----------------------------------------------------------------

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

    void fillAccountsList(QList<AccountItem*>* list);

    //-----------------------------------------------------------------
    // contacts
    //-----------------------------------------------------------------

    // add new contact
    Q_INVOKABLE void addContact(const QString& account, const QString& buddy, const QString& uri);

    // change contact
    Q_INVOKABLE void changeContact(const QString& account,
                                const QString& buddy, const QString& uri,
                                const QString& newbuddy, const QString& newuri);

    // delete account
    Q_INVOKABLE void deleteContact(const QString& account, const QString& buddy, const QString& uri);

    void fillContactsList(const QString& account, QList<ContactItem*>* list);
    void clearContactsList();

    //-----------------------------------------------------------------
    // calls log
    //-----------------------------------------------------------------

    void addCallInfo();
    void getCallInfo();
    void clearCallsList();

    //-----------------------------------------------------------------
    // message log
    //-----------------------------------------------------------------

    void addMessageInfo(MessageItem* msg);
    void getMessageInfo();
    void clearMessagesList();
    void fillMessagesList(QList<MessageItem*>* list);

    //-----------------------------------------------------------------
    // init db
    //-----------------------------------------------------------------

    void createWhisperrDB();
    void createAccountTable();
    void createContactListTable();
    void createCallTable();
    void createMessageTable();

protected:


signals:
    void accountsTableChanged();
    void contactsTableChanged(const QString& account);
    void messagesTableChanged();

public slots:
};

#endif // DBPROVIDER_H
