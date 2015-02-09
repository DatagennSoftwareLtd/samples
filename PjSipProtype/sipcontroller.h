#ifndef SIPCONTROLLER_H
#define SIPCONTROLLER_H

#include <QObject>
#include <QtQuick>

#include <pjsua-lib/pjsua.h>

class SipController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString serverUrl READ serverUrl WRITE setServerUrl NOTIFY serverUrlChanged)
    Q_PROPERTY(QString user READ user WRITE setUser NOTIFY userChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString buddy READ buddy WRITE setBuddy NOTIFY buddyChanged)

    Q_PROPERTY(QString statusMessage READ statusMessage WRITE setStatusMessage NOTIFY statusMessageChanged)

public:
    explicit SipController(QObject *parent = 0);
    ~SipController();

    QString serverUrl() const { return _serverUrl; }
    void setServerUrl(const QString&);

    QString user() const { return _user; }
    void setUser(const QString&);

    QString password() const { return _password; }
    void setPassword(const QString&);

    QString buddy() const { return _buddy; }
    void setBuddy(const QString&);

    QString statusMessage() const { return _statusMessage; }
    void setStatusMessage(const QString&);

    static void setStatusMessage2(SipController* sipContr, const QString&);
signals:
    void serverUrlChanged(const QString);
    void userChanged(const QString);
    void passwordChanged(const QString);
    void buddyChanged(const QString);
    void statusMessageChanged(const QString);

public slots:

    Q_INVOKABLE void create();
    Q_INVOKABLE void init();
    Q_INVOKABLE void destroy();

    Q_INVOKABLE void addTransport();
    Q_INVOKABLE void start();
    Q_INVOKABLE void createSIPAccount();

    Q_INVOKABLE void makeCall();

    Q_INVOKABLE void acceptCall();
    Q_INVOKABLE void rejectCall();

protected:
    static void on_incoming_call(pjsua_acc_id acc_id, pjsua_call_id call_id,
                     pjsip_rx_data *rdata);

    static void on_call_state(pjsua_call_id call_id, pjsip_event *e);

    static void on_call_media_state(pjsua_call_id call_id);

public:
    static SipController* _contr;

private:

    QString _serverUrl;
    QString _user;
    QString _password;
    QString _buddy;
    QString _statusMessage;

    // pjsua
    pjsua_acc_id acc_id;
    pj_status_t status;
    pjsua_config cfg;
    pjsua_logging_config log_cfg;

    static pjsua_call_id current_call_id; // Incoming call identification

};

#endif // SIPCONTROLLER_H
