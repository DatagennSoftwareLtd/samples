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


//------------- JS API -------------------
/*
int BridgeJS::login(QString username, QString password)
{
    return RETURN_OK;
}

int BridgeJS::signup(QString username, QString password)
{
    return RETURN_OK;
}

int BridgeJS::logoff()
{
    return RETURN_OK;
}

int BridgeJS::resetPassword(QString emailAddress)
{
    return RETURN_OK;
}

int BridgeJS::changeLanguage(language lng)
{
    return RETURN_OK;
}
*/
// int configure(sessionToken, feature, value);
// int getInfo(sessionToken, feature);

// configure(sessionToken, feature, value)
// getInfo(sessionToken, feature)

// Note: where to find contact profile picture? From PHP API or from Phone contacts list? Both?
//int function manageContact(sessionToken, action, info[]);
// action: add {name, picture, status(OK/Ignore/Blocked), numbers[], emails[]} / update {contactId, name, picture, status(OK/Ignore/Blocked), numbers[], emails[]} / remove {contactId}
/*
int BridgeJS::getContacts(tokenID32 sessionToken)
{
    return RETURN_OK;
}

int BridgeJS::getContactDetails(tokenID32 sessionToken, contactID32 contactId)
{
    return RETURN_OK;
}

int BridgeJS::getCallLogs(tokenID32 sessionToken, long startPos, long itemCount)
{
    return RETURN_OK;
}

int BridgeJS::removeCallLog(tokenID32 sessionToken, long callId)
{
    return RETURN_OK;
}

int BridgeJS::clearCallLogs(tokenID32 sessionToken)
{
    return RETURN_OK;
}

int BridgeJS::getCallDetails(tokenID32 sessionToken, long callId)
{
    return RETURN_OK;
}

// Get list of conversations and groups with different people only displaying the info of the last conversation with each person
int BridgeJS::getChatsList(tokenID32 sessionToken, long startPos, long itemCount)
{
    return RETURN_OK;
}

int BridgeJS::getMessages(tokenID32 sessionToken, long conversationOrGroupId,
                          long startPos, long itemCount)
{
    return RETURN_OK;
}
*/
