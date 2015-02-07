#ifndef SIPCONTROLLER_H
#define SIPCONTROLLER_H

#include <QObject>
#include <QtQuick>

#include <pjsua-lib/pjsua.h>

class SipController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString login READ login WRITE setLogin NOTIFY loginChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)


public:
    explicit SipController(QObject *parent = 0);
    ~SipController();

    QString login() const { return _login; }
    void setLogin(const QString&);

    QString password() const { return _password; }
    void setPassword(const QString&p);

signals:
    void loginChanged(const QString);
    void passwordChanged(const QString);

public slots:

    void create();
    void init();
    void destroy();

    void addTransport();
    void start();
    void createSIPAccount();

    void makeCall();

private:

    QString _login;
    QString _password;

    // pjsua
    pjsua_acc_id acc_id;
    pj_status_t status;
    pjsua_config cfg;
    pjsua_logging_config log_cfg;
};

#endif // SIPCONTROLLER_H
