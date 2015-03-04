#ifndef BRIDGEJS_H
#define BRIDGEJS_H

#include <QObject>
#include <QVariant>
#include <QtQuick>

//class SipController;

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

    // API
    int login(QString username, QString password);
    int signup (QString username, QString password);
    int logoff();
    int resetPassword(QString emailAddress);

    enum language {EN = 0, };
    int changeLanguage(language lng = EN);

    // configure(sessionToken, feature, value)
    // getInfo(sessionToken, feature)


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
