#ifndef MENUITEM_H
#define MENUITEM_H

#include <QObject>
#include <QtQuick>

class MenuItem : public QObject
{
    Q_OBJECT

    Q_ENUMS(ItemType)
    Q_ENUMS(IconPosition)

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString value READ value WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(QString iconUrl READ iconUrl WRITE setIconUrl NOTIFY iconUrlChanged)
    Q_PROPERTY(int type READ type WRITE setType NOTIFY typeChanged)
    Q_PROPERTY(int iconPos READ iconPos WRITE setIconPos NOTIFY iconPosChanged)

public:

    enum ItemType
    {
        ItButton,
        ItEdit,
        ItChecker,
    };

    enum IconPosition
    {
        IpLeft,
        IpRight,
    };

    explicit MenuItem(QObject *parent = 0);
    ~MenuItem();

    QString name() const { return _name; }
    void setName(const QString &n);

    QString value() const { return _value; }
    void setValue(const QString &v);

    QString iconUrl() const { return _iconUrl; }
    void setIconUrl(const QString &u);

    int type() const { return _type; }
    void setType(const int &t);

    int iconPos() const { return _iconPos; }
    void setIconPos(const int &i);

signals:
    void nameChanged(const QString &n);
    void valueChanged(const QString &v);
    void iconUrlChanged(const QString &u);
    void typeChanged(const int &t);
    void iconPosChanged(const int &i);

private:
  QString _name;
  QString _value;
  QString _iconUrl;
  ItemType _type;
  IconPosition _iconPos;
};

#endif // MENUITEM_H
