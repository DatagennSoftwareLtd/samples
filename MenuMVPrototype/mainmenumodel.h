#ifndef MAINMENUMODEL_H
#define MAINMENUMODEL_H

#include <QObject>
#include <QtQuick>

class MenuItem : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)

public:
    explicit MenuItem(QObject *parent = 0)
        : QObject(parent)
        , _name("")
        , _value("")
    {

    }

    ~MenuItem()
    {

    }

    QString name() const { return _name; }

    void setName(const QString &n)
    {
        if(_name == n)
            return;
        _name = n;
        emit nameChanged(n);
    }

signals:
    void nameChanged(const QString &n);

private:
  QString _name;
  QString _value;
};

class MainMenuModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<MenuItem> list READ list CONSTANT)

public:
    explicit MainMenuModel(QObject *parent = 0);
    ~MainMenuModel();

    QQmlListProperty<MenuItem> list() {
            return QQmlListProperty<MenuItem>(this, _list);
        }

    void timerEvent(QTimerEvent *) {
        _list[1]->setName(_list[1]->name() + QStringLiteral("C++"));
    }

signals:

public slots:

private:
    QList<MenuItem*> _list;
};

#endif // MAINMENUMODEL_H
