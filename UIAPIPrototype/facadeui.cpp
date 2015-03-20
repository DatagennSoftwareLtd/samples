#include "facadeui.h"
#include "restapicontroller.h"

#include <QtDebug>

FacadeUI::FacadeUI(QObject *parent) : QObject(parent)
{
    sr = new ServerResponse();
    contr = new restAPIcontroller();
    QObject::connect(contr, SIGNAL(responseMsg(QString)), this, SLOT(message(const QString)));
}

FacadeUI::~FacadeUI()
{

}

int FacadeUI::login(const QString& username, const QString& password, const QString& lang)
{
    qDebug() << "FacadeUI::login: " << username << " : " << password;
qDebug() << sr;
    contr->on_login(username, password, lang, sr);
    return RETURN_OK;
}

int FacadeUI::resetPassword(const QString& emailAddress, const QString& lang)
{
    qDebug() << "FacadeUI::resetPassword";

    contr->on_resetPassword(emailAddress, lang, sr);
    return RETURN_OK;
}

int FacadeUI::signup(const QString& username, const QString& password, const QString& lang)
{
    qDebug() << "FacadeUI::signup: " << username << " : " << password;

    contr->on_signup(username, password, lang, sr);
    return RETURN_OK;
}

int FacadeUI::backup(const QString& token, const QString& pin, const QString& xml, const QString& lang)
{
    return RETURN_OK;
}

int FacadeUI::restore(const QString& token, const QString& pin, const QString& lang)
{
    return RETURN_OK;
}


int FacadeUI::logoff()
{
    return RETURN_OK;
}


void FacadeUI::message(const QString msg)
{
    qDebug() << "FacadeUI::message: " << msg;
    emit statusMessageChanged(msg);
}
