#ifndef BRIDGEJS_H
#define BRIDGEJS_H

#include <QObject>
#include <QVariant>
#include <QtQuick>

#include "./src/model/whisperrstructures.h"

enum {
    RETURN_OK = 100,
};

class BridgeJS : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString serverUrl READ serverUrl WRITE setServerUrl NOTIFY serverUrlChanged)
    Q_PROPERTY(QString user READ user WRITE setUser NOTIFY userChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString buddy READ buddy WRITE setBuddy NOTIFY buddyChanged)

    //Q_PROPERTY(QString statusMessage READ statusMessage WRITE setStatusMessage NOTIFY statusMessageChanged)

public:
    explicit BridgeJS(QObject *parent = 0);
    ~BridgeJS();

    QString serverUrl() const { return _serverUrl; }
    void setServerUrl(const QString&);

    QString user() const { return _user; }
    void setUser(const QString&);

    QString password() const { return _password; }
    void setPassword(const QString&);

    QString buddy() const { return _buddy; }
    void setBuddy(const QString&);

    //void setSipUa(SipController* s);

    /*
    // API
    int login(QString username, QString password);
    int signup(QString username, QString password);
    int logoff();
    int resetPassword(QString emailAddress);

    enum language {EN = 0, };
    int changeLanguage(language lng = EN);

    // int configure(sessionToken, feature, value);
    // int getInfo(sessionToken, feature);

    // Note: where to find contact profile picture? From PHP API or from Phone contacts list? Both?
    // int function manageContact(sessionToken, action, info[]);
    // action: add {name, picture, status(OK/Ignore/Blocked), numbers[], emails[]} / update {contactId, name, picture, status(OK/Ignore/Blocked), numbers[], emails[]} / remove {contactId}

    int getContacts(tokenID32 sessionToken);
    int getContactDetails(tokenID32 sessionToken, contactID32 contactId);


    int getCallLogs(tokenID32 sessionToken, long startPos, long itemCount);
    int removeCallLog(tokenID32 sessionToken, long callId);
    int clearCallLogs(tokenID32 sessionToken);

    int getCallDetails(tokenID32 sessionToken, long callId);

    // Get list of conversations and groups with different people only displaying the info of the last conversation with each person
    int getChatsList(tokenID32 sessionToken, long startPos, long itemCount);

    int getMessages(tokenID32 sessionToken, long conversationOrGroupId, long startPos, long itemCount);
    */
signals:

    void serverUrlChanged(const QString);
    void userChanged(const QString);
    void passwordChanged(const QString);
    void buddyChanged(const QString);

    // pjsip API
    void makeCall();
    void acceptCall();
    void rejectCall();
    void registered();
    //void logMessage(QString);
    void logMessage(QVariant);

    void outgoingIm(QString to, QString text);

public slots:

    void makeCallSlot();
    void acceptCallSlot();
    void rejectCallSlot();
    void registeredSlot();

    void outgoingImSlot(QString to, QString text);

    void logMessageSlot(QString);

protected:
    QString _serverUrl;
    QString _user;
    QString _password;
    QString _buddy;

    //SipController* sipua;
};

#endif // BRIDGEJS_H
