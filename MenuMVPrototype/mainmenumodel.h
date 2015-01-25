#ifndef MAINMENUMODEL_H
#define MAINMENUMODEL_H

#include <QObject>
#include <QtQuick>

class MenuItem;

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

signals:

public slots:

private:
    QList<MenuItem*> _list;

    QList<MenuItem*> _pinLockSubmenu;
    QList<MenuItem*> _blockedContactsSubmenu;
    QList<MenuItem*> _notificationSubmenu;
    QList<MenuItem*> _myAccountSubmenu;
    QList<MenuItem*> _inviteFriendsSubmenu;
};

#endif // MAINMENUMODEL_H
