#ifndef MENUITEM_H
#define MENUITEM_H

#include <QObject>
#include <QtQuick>

class MenuItem : public QObject
{
    Q_OBJECT

    Q_ENUMS(ItemType)

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString value READ value WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(int type READ type WRITE setType NOTIFY typeChanged)

public:

    enum ItemType
    {
        ItButton,
        ItEdit,
        ItChecker,
    };
    //Q_DECLARE_METATYPE(ItemType)

    explicit MenuItem(QObject *parent = 0);
    ~MenuItem();

    QString name() const { return _name; }
    void setName(const QString &n);

    QString value() const { return _value; }
    void setValue(const QString &v);

    int type() const { return _type; }
    void setType(const int &t);

signals:
    void nameChanged(const QString &n);
    void valueChanged(const QString &v);
    void typeChanged(const int &t);

private:
  QString _name;
  QString _value;
  ItemType _type;
};

#endif // MENUITEM_H
