#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "dbprovider.h"
#include "accountsmodel.h"
#include "accountitem.h"
#include "contactsmodel.h"
#include "contactitem.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    DbProvider* dbProvider = new DbProvider();

    AccountsModel* accounts = new AccountsModel();
    ContactsModel* contacts = new ContactsModel();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty(QStringLiteral("dbProvider"), dbProvider);

    qmlRegisterType<AccountItem>("AccountItem", 1, 0, "AccountItem");
    qmlRegisterType<ContactItem>("ContactItem", 1, 0, "ContactItem");

    context->setContextProperty(QStringLiteral("accountsModel"), accounts);
    context->setContextProperty(QStringLiteral("contactsModel"), contacts);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
