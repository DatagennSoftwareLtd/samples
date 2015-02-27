#include "dbprovider.h"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

DbProvider::DbProvider(QObject *parent) : QObject(parent)
{

}

DbProvider::~DbProvider()
{

}

void DbProvider::create()
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
                " CREATE TABLE IF NOT EXISTS TableOne "
                " ( "
                       "  ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                       "  Server VARCHAR(100) "
                       "  User VARCHAR(100) "
                       "  Password VARCHAR(100) "
                "  ); "
    );

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "2: " << Query.lastError().text();
    }

    Query.prepare
    (
                "INSERT INTO TableOne (ID, Server, User, Password)"
                "VALUES (3, 'first')"
    );

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "3: " << Query.lastError().text();
    }

    Query.prepare
    (
                "INSERT INTO TableOne (ID, Name)"
                "VALUES (4, 'second')"
    );

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "4: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
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
        "VALUES ('" + account + "')"
        "VALUES ('" + server + "')"
        "VALUES ('" + user + "')"
        "VALUES ('" + password + "')"
    );
    qDebug() << "addAccount prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "addAccount: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
}

void DbProvider::changeAccount(const QString& account, const QString& server,
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
        " UPDATE AccountTable "
        " SET Account = '" + account + "' , Server = '" + server + "' , "
        " User = '" + user + "' , Password = '" + password + "'"
        " WHERE Account = '" + account + "' AND "
        " Server = '" + server + "'"
    );
    qDebug() << "changeAccount prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "changeAccount: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
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
        "DELETE FROM AccountTable"
        "WHERE Account = '" + account + "' AND "
        " Server = '" + server + "'"
    );
    qDebug() << "deleteAccount prepare: " << res;

    Query.exec();
    if(!Query.isActive())
    {
        qDebug() << "deleteAccount: " << Query.lastError().text();
    }

    DB.close();
    DB = QSqlDatabase();
    QSqlDatabase::removeDatabase("Con_1");
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
               "  Account VARCHAR(100) "
               "  Server VARCHAR(100) "
               "  User VARCHAR(100) "
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
               "  Account VARCHAR(100) "
               "  Name VARCHAR(100) "
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
