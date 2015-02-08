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


public:
    explicit SipController(QObject *parent = 0);
    ~SipController();

    QString serverUrl() const { return _serverUrl; }
    void setServerUrl(const QString&);

    QString user() const { return _user; }
    void setUser(const QString&);

    QString password() const { return _password; }
    void setPassword(const QString&p);

signals:
    void serverUrlChanged(const QString);
    void userChanged(const QString);
    void passwordChanged(const QString);

public slots:

    Q_INVOKABLE void create();
    Q_INVOKABLE void init();
    Q_INVOKABLE void destroy();

    Q_INVOKABLE void addTransport();
    Q_INVOKABLE void start();
    Q_INVOKABLE void createSIPAccount();

    Q_INVOKABLE void makeCall();

private:

    QString _serverUrl;
    QString _user;
    QString _password;

    // pjsua
    pjsua_acc_id acc_id;
    pj_status_t status;
    pjsua_config cfg;
    pjsua_logging_config log_cfg;
};

#endif // SIPCONTROLLER_H
