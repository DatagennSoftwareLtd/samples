#include "dbprovider.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

#include "../accounts/accountsmodel.h"
#include "../accounts/accountitem.h"

#include "../contacts/contactsmodel.h"
#include "../contacts/contactitem.h"

#include "../logs/messageitem.h"
#include "../logs/messagemodel.h"

DbProvider::DbProvider(QObject *parent) : QObject(parent)
{

}

DbProvider::~DbProvider()
{

}

void DbProvider::fillAccountsList(QList<AccountItem*>* list)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
        return;
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        "SELECT Account, User, Password FROM AccountTable"
    );
    qDebug() << "fillAccountsList prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "fillAccountsList: " << Query.lastError().text();
        return;
    }

    while (Query.next())
    {
        list->append(new AccountItem());
        list->last()->setName(Query.value(0).toString());
        list->last()->setUser(Query.value(1).toString());
        list->last()->setPassword(Query.value(2).toString());
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
}

void DbProvider::fillContactsList(const QString& account, QList<ContactItem*>* list)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
        return;
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        "SELECT Name, SipUri FROM ContactListTable WHERE Account = :account"
    );
    Query.bindValue(":account", account);

    qDebug() << "fillContactsList prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "fillContactsList: " << Query.lastError().text();
        return;
    }

    while (Query.next())
    {
        list->append(new ContactItem());
        list->last()->setName(Query.value(0).toString());
        list->last()->setUri(Query.value(1).toString());
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
}

void DbProvider::create()
{

}

void DbProvider::open()
{

}

void DbProvider::close()
{

}

void DbProvider::remove()
{

}

void DbProvider::addUse(const QString& account, const QString& server,
                        const QString& user, const QString& password)
{

}

void DbProvider::addAccount(const QString& account, const QString& server,
                   const QString& user, const QString& password)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        "INSERT INTO AccountTable (Account, Server, User, Password)"
        "VALUES (:account, :server, :user, :password)"
    );
    Query.bindValue(":account", account);
    Query.bindValue(":server", server);
    Query.bindValue(":user", user);
    Query.bindValue(":password", password);

    qDebug() << "addAccount prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "addAccount: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");

    emit accountsTableChanged();
}

void DbProvider::changeAccount(const QString& account, const QString& server,
                   const QString& user, const QString& password,
                   const QString& newaccount, const QString& newserver,
                   const QString& newuser, const QString& newpassword)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        " UPDATE AccountTable "
        " SET Account = :newaccount , Server = :newserver , "
        " User = :newuser , Password = :newpassword "
        " WHERE Account = :account  AND "
        " Server = :server AND "
        " User = :user AND "
        " Password = :password "
    );

    Query.bindValue(":newaccount", newaccount);
    Query.bindValue(":newserver", newserver);
    Query.bindValue(":newuser", newuser);
    Query.bindValue(":newpassword", newpassword);
    Query.bindValue(":account", account);
    Query.bindValue(":server", server);
    Query.bindValue(":user", user);
    Query.bindValue(":password", password);


    qDebug() << "changeAccount prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "changeAccount: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");

    emit accountsTableChanged();
}

void DbProvider::deleteAccount(const QString& account, const QString& server,
                   const QString& user, const QString& password)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        " DELETE FROM AccountTable "
        " WHERE Account = :account  AND "
        " Server = :server AND "
        " User = :user AND "
        " Password = :password "
    );

    Query.bindValue(":account", account);
    Query.bindValue(":server", server);
    Query.bindValue(":user", user);
    Query.bindValue(":password", password);

    qDebug() << "deleteAccount prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "deleteAccount: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");

    emit accountsTableChanged();
}


void DbProvider::addContact(const QString& account, const QString& buddy, const QString& uri)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        "INSERT INTO ContactListTable (Account, Name, SipUri)"
        "VALUES (:account, :name, :sipuri)"
    );
    Query.bindValue(":account", account);
    Query.bindValue(":name", buddy);
    Query.bindValue(":sipuri", uri);

    qDebug() << "addContact prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "addContact: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");

    emit contactsTableChanged(account);
}

void DbProvider::changeContact(const QString& account,
                            const QString& buddy, const QString& uri,
                            const QString& newbuddy, const QString& newuri)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        " UPDATE ContactListTable "
        " SET Account = :account , Name = :newname , "
        " SipUri = :newsipuri "
        " WHERE Account = :account  AND "
        " Name = :name AND "
        " SipUri = :sipuri "
    );

    Query.bindValue(":account", account);
    Query.bindValue(":newname", newbuddy);
    Query.bindValue(":newsipuri", newuri);
    Query.bindValue(":name", buddy);
    Query.bindValue(":sipuri", uri);

    qDebug() << "changeContact prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "changeContact: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");

    emit contactsTableChanged(account);
}

void DbProvider::deleteContact(const QString& account, const QString& buddy, const QString& uri)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        " DELETE FROM ContactListTable "
        " WHERE Account = :account  AND "
        " Name = :name AND "
        " SipUri = :sipuri "
    );

    Query.bindValue(":account", account);
    Query.bindValue(":name", buddy);
    Query.bindValue(":sipuri", uri);

    qDebug() << "deleteContact prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "deleteContact: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");

    emit contactsTableChanged(account);
}

//----------------------------------------------------------------
//
//----------------------------------------------------------------

void DbProvider::createWhisperrDB()
{
    createAccountTable();
    createContactListTable();
    createCallTable();
    createMessageTable();
}

void DbProvider::createAccountTable()
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    Query.prepare
    (
        " CREATE TABLE IF NOT EXISTS AccountTable "
        " ( "
               "  ID INTEGER PRIMARY KEY AUTOINCREMENT, "
               "  Account VARCHAR(100), "
               "  Server VARCHAR(100), "
               "  User VARCHAR(100), "
               "  Password VARCHAR(100) "
        "  ); "
    );

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "AccountTable: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
}

void DbProvider::createContactListTable()
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    Query.prepare
    (
        " CREATE TABLE IF NOT EXISTS ContactListTable "
        " ( "
               "  ID INTEGER PRIMARY KEY AUTOINCREMENT, "
               "  Account VARCHAR(100), "
               "  Name VARCHAR(100), "
               "  SipUri VARCHAR(100) "
        "  ); "
    );

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "ContactList: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
}

void DbProvider::createCallTable()
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    Query.prepare
    (
        " CREATE TABLE IF NOT EXISTS CallListTable "
        " ( "
               " CALL_ID INTEGER PRIMARY KEY AUTOINCREMENT, "
               " Direction VARCHAR(100), "
               " Name VARCHAR(100), "
               " Number VARCHAR(100), "
               " Picture VARCHAR(100), "
               " MyNumber VARCHAR(100), "
               " Date VARCHAR(100), "
               " Time VARCHAR(100), "
               " CallDuration VARCHAR(100) "
        "  );  "
    );

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "CallList: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
}

void DbProvider::createMessageTable()
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    Query.prepare
    (
        " CREATE TABLE IF NOT EXISTS MessageListTable "
        " ( "
               " MSG_ID INTEGER PRIMARY KEY AUTOINCREMENT, "
               " Direction VARCHAR(100), "
               " Name VARCHAR(100), "
               " Number VARCHAR(100), "
               " Picture VARCHAR(100), "
               " MyNumber VARCHAR(100), "
               " Date VARCHAR(100), "
               " Time VARCHAR(100), "
               " Message VARCHAR(1024), "
               " Type VARCHAR(100) "
        "  );  "
    );

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "MessageList: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");

}


//-----------------------------------------------------------------
// calls log
//-----------------------------------------------------------------

void DbProvider::addCallInfo()
{

}

void DbProvider::getCallInfo()
{

}

void DbProvider::clearCallsList()
{

}

//-----------------------------------------------------------------
// message log
//-----------------------------------------------------------------

void DbProvider::addMessageInfo(MessageItem* msg)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        "INSERT INTO MessageListTable (Direction, Name, Number, Picture, MyNumber, "
        "Date, Time, Message, Type) "
        "VALUES (:direction, :name, :number, :picture, :mynumber, :date, :time, :message, :type)"
    );
    Query.bindValue(":direction", msg->direction());
    Query.bindValue(":name", msg->name());
    Query.bindValue(":number", msg->number());
    Query.bindValue(":picture", msg->picture());
    Query.bindValue(":mynumber", msg->mynumber());
    Query.bindValue(":date", msg->date());
    Query.bindValue(":time", msg->time());
    Query.bindValue(":message", msg->message());
    Query.bindValue(":type", msg->type());



    qDebug() << "addMessage prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "addMessage: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");

    emit messagesTableChanged();
}

void DbProvider::getMessageInfo()
{

}

void DbProvider::clearMessagesList()
{

}

void DbProvider::fillMessagesList(QList<MessageItem*>* list)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_Whisperr.sqlite");
    if(!DB.open())
    {
        qDebug("DB_NOT_OPEN");
        return;
    }

    QSqlQuery Query(DB);
    bool res = Query.prepare
    (
        "SELECT Direction, Name, Number, Picture, MyNumber, "
        "Date, Time, Message, Type FROM MessageListTable"
    );

    qDebug() << "fillMessagesList prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "fillMessagesList: " << Query.lastError().text();
        return;
    }

    while (Query.next())
    {
        list->append(new MessageItem());
        list->last()->setDirection(Query.value(0).toString());
        list->last()->setName(Query.value(1).toString());
        list->last()->setNumber(Query.value(2).toString());
        list->last()->setPicture(Query.value(3).toString());
        list->last()->setMynumber(Query.value(4).toString());
        list->last()->setDate(Query.value(5).toString());
        list->last()->setTime(Query.value(6).toString());
        list->last()->setMessage(Query.value(7).toString());
        list->last()->setType(Query.value(8).toString());
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
}
