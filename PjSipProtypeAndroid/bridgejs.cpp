#include "bridgejs.h"
//#include "sipcontroller.h"

BridgeJS::BridgeJS(QObject *parent)
    : QObject(parent)
    , _serverUrl("")
    , _user("")
    , _password("")
    , _buddy("")
    //, sipua(0)
{

}

BridgeJS::~BridgeJS()
{

}

/*
void BridgeJS::setSipUa(SipController* s)
{
    sipua = s;
}
*/
void BridgeJS::setServerUrl(const QString& url)
{
    if(_serverUrl == url)
        return;
    _serverUrl = url;

    //if(sipua)
    //    sipua->setServerUrl(url);

    emit serverUrlChanged(url);
}

void BridgeJS::setUser(const QString& u)
{
    if(_user == u)
        return;
    _user = u;

    //if(sipua)
      //  sipua->setUser(u);

    emit userChanged(u);
}

void BridgeJS::setPassword(const QString& p)
{
    if(_password == p)
        return;
    _password = p;

    //if(sipua)
      //  sipua->setPassword(p);

    emit passwordChanged(p);
}

void BridgeJS::setBuddy(const QString& b)
{
    if(_buddy == b)
        return;
    _buddy = b;

    //if(sipua)
      //  sipua->setBuddy(b);

    emit buddyChanged(b);
}



void BridgeJS::makeCallSlot()
{
    emit makeCall();
}

void BridgeJS::acceptCallSlot()
{
    emit acceptCall();
}

void BridgeJS::rejectCallSlot()
{
    emit rejectCall();
}

void BridgeJS::registeredSlot()
{
    emit registered();
}

void BridgeJS::logMessageSlot(QString m)
{
    emit logMessage(QVariant(m));
}

void BridgeJS::outgoingImSlot(QString to, QString text)
{
    emit outgoingIm(to, text);
}
