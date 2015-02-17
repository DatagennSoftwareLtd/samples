#include "sipcontroller.h"

pjsua_call_id SipController::current_call_id;

SipController* SipController::_contr = 0;
//QString SipController::_statusMessage = "Ready";

/* Callback called by the library upon receiving incoming call */
//static
void SipController::on_incoming_call(pjsua_acc_id acc_id, pjsua_call_id call_id,
                 pjsip_rx_data *rdata)
{
    pjsua_call_info ci;

    PJ_UNUSED_ARG(acc_id);
    PJ_UNUSED_ARG(rdata);

    current_call_id = call_id;
    pjsua_call_get_info(call_id, &ci);

    qDebug() << ci.remote_contact.ptr;
    qDebug() << ci.remote_info.ptr;

    if(_contr)
        setStatusMessage2(_contr, ci.remote_info.ptr);

    /*
    PJ_LOG(3,(THIS_FILE, "Incoming call from %.*s!!",
             (int)ci.remote_info.slen,
             ci.remote_info.ptr));
    */

    /* Automatically answer incoming calls with 200/OK */
   // pjsua_call_answer(call_id, 200, NULL, NULL);
}

/* Callback called by the library when call's state has changed */
//static
void SipController::on_call_state(pjsua_call_id call_id, pjsip_event *e)
{
    pjsua_call_info ci;

    PJ_UNUSED_ARG(e);

    pjsua_call_get_info(call_id, &ci);

    //qDebug() << ci.remote_contact.ptr;
    //qDebug() << ci.remote_info.ptr;//state_text.ptr;

    /*
    PJ_LOG(3,(THIS_FILE, "Call %d state=%.*s", call_id,
             (int)ci.state_text.slen,
             ci.state_text.ptr));
             */

}

/* Callback called by the library when call's media state has changed */
//static
void SipController::on_call_media_state(pjsua_call_id call_id)
{
    pjsua_call_info ci;

    pjsua_call_get_info(call_id, &ci);

    if (ci.media_status == PJSUA_CALL_MEDIA_ACTIVE) {
    // When media is active, connect call to sound device.
    pjsua_conf_connect(ci.conf_slot, 0);
    pjsua_conf_connect(0, ci.conf_slot);
    }
}

SipController::SipController(QObject *parent)
    : QObject(parent)
    , _serverUrl("")
    , _user("")
    , _password("")
    , _buddy("")
    , _statusMessage("Ready")
{

}

SipController::~SipController()
{

}

void SipController::setServerUrl(const QString& url)
{
    if(_serverUrl == url)
        return;
    _serverUrl = url;
    emit serverUrlChanged(url);
}

void SipController::setUser(const QString& l)
{
    if(_user == l)
        return;
    _user = l;
    emit userChanged(l);
}

void SipController::setPassword(const QString& p)
{
    if(_password == p)
        return;
    _password = p;
    emit passwordChanged(p);
}

void SipController::setBuddy(const QString& b)
{
    if(_buddy == b)
        return;
    _buddy = b;
    emit buddyChanged(b);
}

void SipController::setStatusMessage(const QString& m)
{
    if(_statusMessage == m)
        return;
    _statusMessage = m;
    qDebug() << m;
    emit statusMessageChanged(m);
}

void SipController::setStatusMessage2(SipController* sipContr, const QString& m)
{
    qDebug() << m;
    sipContr->setStatusMessage(m);
}

void SipController::create()
{
    status = pjsua_create();
    if (status != PJ_SUCCESS)
        setStatusMessage("error");
}

void SipController::init()
{
    pjsua_config_default(&cfg);
    cfg.cb.on_incoming_call = &SipController::on_incoming_call;
    cfg.cb.on_call_media_state = &SipController::on_call_media_state;
    cfg.cb.on_call_state = &SipController::on_call_state;

    pjsua_logging_config_default(&log_cfg);
    log_cfg.console_level = 4;

    status = pjsua_init(&cfg, &log_cfg, NULL);
    if (status != PJ_SUCCESS)
        setStatusMessage("error");
}

void SipController::destroy()
{
    pjsua_destroy();
}

void SipController::addTransport()
{
    pjsua_transport_config cfg;

    pjsua_transport_config_default(&cfg);
    cfg.port = 5060;
    status = pjsua_transport_create(PJSIP_TRANSPORT_UDP, &cfg, NULL);
    if (status != PJ_SUCCESS)
        setStatusMessage("error");
}

void SipController::start()
{
    status = pjsua_start();
    if (status != PJ_SUCCESS)
        setStatusMessage("error");
}

void SipController::createSIPAccount()
{
    pjsua_acc_config cfg;

    pjsua_acc_config_default(&cfg);

    QString tmp = "sip:" + _user + "@" + _serverUrl;

    char* cId = new char[tmp.toLatin1().toStdString().length() + 1];
    strcpy(cId, tmp.toLatin1().toStdString().c_str());

    tmp = "sip:" + _serverUrl;
    char* cUri = new char[tmp.toLatin1().toStdString().length() + 1];
    strcpy(cUri, tmp.toLatin1().toStdString().c_str());


    char* cUser = new char[_user.toLatin1().toStdString().length() + 1];
    strcpy(cUser, _user.toLatin1().toStdString().c_str());

    char* cPwd = new char[_password.toLatin1().toStdString().length() + 1];
    strcpy(cPwd, _password.toLatin1().toStdString().c_str());

    cfg.id = pj_str(cId);
    //cfg.id = pj_str("sip:device1@sip.whisperr.com");
    cfg.reg_uri = pj_str(cUri);
    //cfg.reg_uri = pj_str("sip:sip.whisperr.com");
    cfg.cred_count = 1;
    cfg.cred_info[0].realm = pj_str((char*)"*");
    cfg.cred_info[0].scheme = pj_str((char*)"digest");
    cfg.cred_info[0].username = pj_str(cUser);
    //cfg.cred_info[0].username = pj_str("device1");
    cfg.cred_info[0].data_type = PJSIP_CRED_DATA_PLAIN_PASSWD;
    cfg.cred_info[0].data = pj_str(cPwd);
    //cfg.cred_info[0].data = pj_str("device1");

    /*
    delete[] cId;
    delete[] cUri;
    delete[] cUser;
    delete[] cPwd;
    */

    status = pjsua_acc_add(&cfg, PJ_TRUE, &acc_id);
    if (status != PJ_SUCCESS)
        setStatusMessage("error");
    else
        setStatusMessage("registered");

}

void SipController::makeCall()
{
    QString tmp = "sip:" + _buddy;
    char* cBuddy = new char[tmp.toLatin1().toStdString().length() + 1];
    strcpy(cBuddy, tmp.toLatin1().toStdString().c_str());

    pj_str_t uri = pj_str(cBuddy);
    //pj_str_t uri = pj_str("sip:pete@sip.whisperr.com");

    //delete[] cBuddy;

    status = pjsua_call_make_call(acc_id, &uri, 0, NULL, NULL, NULL);
    if (status != PJ_SUCCESS)
        setStatusMessage("error");
    else
        setStatusMessage("calling");
}

void SipController::acceptCall()
{
   // answer incoming calls with 200/OK
   pjsua_call_answer(current_call_id, 200, NULL, NULL);
   setStatusMessage("accepted");
}

void SipController::rejectCall()
{
    pjsua_call_hangup(current_call_id, 0, NULL, NULL);
    setStatusMessage("rejected");
}

void SipController::registered()
{
    create();
    init();
    addTransport();
    start();
    createSIPAccount();
    setStatusMessage("registered");
}
