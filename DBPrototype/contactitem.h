#ifndef CONTACTITEM_H
#define CONTACTITEM_H

#include <QObject>
#include <QtQuick>

class ContactItem : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString uri READ uri WRITE setUri NOTIFY uriChanged)

public:

    explicit ContactItem(QObject *parent = 0);
    ~ContactItem();

    QString name() const { return _name; }
    void setName(const QString &n);

    QString uri() const { return _uri; }
    void setUri(const QString &u);

signals:
    void nameChanged(const QString &n);
    void uriChanged(const QString &u);

private:
  QString _name;
  QString _uri;
};

#endif // CONTACTITEM_H
