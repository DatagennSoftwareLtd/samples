#ifndef ACCOUNTITEM_H
#define ACCOUNTITEM_H

#include <QObject>
#include <QtQuick>

class AccountItem : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString user READ user WRITE setUser NOTIFY userChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)

public:

    explicit AccountItem(QObject *parent = 0);
    ~AccountItem();

    QString name() const { return _name; }
    void setName(const QString &n);

    QString user() const { return _user; }
    void setUser(const QString &u);

    QString password() const { return _password; }
    void setPassword(const QString &p);

signals:
    void nameChanged(const QString &n);
    void userChanged(const QString &u);
    void passwordChanged(const QString &p);

private:
  QString _name;
  QString _user;
  QString _password;
};

#endif // ACCOUNTITEM_H
