#include "dbprovider.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

#include "accountsmodel.h"
#include "accountitem.h"

#include "contactsmodel.h"
#include "contactitem.h"

DbProvider::DbProvider(QObject *parent) : QObject(parent)
{

}

DbProvider::~DbProvider()
{

}

void DbProvider::fillAccountsList(QList<AccountItem*>* list)
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_One.sqlite");
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
    DB.setDatabaseName("DB_One.sqlite");
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
    DB.setDatabaseName("DB_One.sqlite");
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
    DB.setDatabaseName("DB_One.sqlite");
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
    DB.setDatabaseName("DB_One.sqlite");
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
    DB.setDatabaseName("DB_One.sqlite");
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
    DB.setDatabaseName("DB_One.sqlite");
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
    DB.setDatabaseName("DB_One.sqlite");
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


void DbProvider::createAccountTable()
{
    QSqlDatabase DB = QSqlDatabase::addDatabase("QSQLITE", "Con_1");
    DB.setDatabaseName("DB_One.sqlite");
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
    DB.setDatabaseName("DB_One.sqlite");
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
