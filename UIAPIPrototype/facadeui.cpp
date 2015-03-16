#include "facadeui.h"

FacadeUI::FacadeUI(QObject *parent) : QObject(parent)
{

}

FacadeUI::~FacadeUI()
{

}

int FacadeUI::login(const QString& username, const QString& password)
{
    return RETURN_OK;
}

int FacadeUI::signup(const QString& username, const QString& password)
{
    return RETURN_OK;
}

int FacadeUI::logoff()
{
    return RETURN_OK;
}

int FacadeUI::resetPassword(const QString& emailAddress)
{
    return RETURN_OK;
}
