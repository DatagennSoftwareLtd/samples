#ifndef MENUITEM_H
#define MENUITEM_H

#include <QObject>
#include <QtQuick>

class MenuItem : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString value READ value WRITE setValue NOTIFY valueChanged)

public:
    explicit MenuItem(QObject *parent = 0);
    ~MenuItem();

    QString name() const { return _name; }
    void setName(const QString &n);

    QString value() const { return _value; }
    void setValue(const QString &v);

signals:
    void nameChanged(const QString &n);
    void valueChanged(const QString &v);

private:
  QString _name;
  QString _value;
};

#endif // MENUITEM_H
