#include "servicecontroller.h"
#include <QtAndroidExtras/QAndroidJniObject>
#include <QtDebug>

ServiceController::ServiceController(QObject *parent)
    : QObject(parent)
    , isRunning(false)
{

}

ServiceController::~ServiceController()
{

}

void ServiceController::startService()
{
    if(isRunning)
        return;

   QAndroidJniObject::callStaticMethod<void>("com/whisperr/samples/ServiceClient",
                                       "startService");

   qDebug() << "ServiceController::startService()";
   isRunning = true;
}

void ServiceController::stopService()
{
    if(!isRunning)
        return;

    QAndroidJniObject::callStaticMethod<void>("com/whisperr/samples/ServiceClient",
                                        "stopService");

    qDebug() << "ServiceController::stopService()";
    isRunning = false;
}
