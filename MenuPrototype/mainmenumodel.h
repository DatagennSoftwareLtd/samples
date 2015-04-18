#ifndef MAINMENUMODEL_H
#define MAINMENUMODEL_H

#include <QObject>

//-------------------------------------
// model for main menu states
//-------------------------------------

class MainMenuModel : public QObject
{
    Q_OBJECT
public:
    explicit MainMenuModel(QObject *parent = 0);
    ~MainMenuModel();

signals:

public slots:
};

#endif // MAINMENUMODEL_H
