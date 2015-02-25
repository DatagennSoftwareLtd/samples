#include "sipcontroller.h"

pjsua_call_id SipController::current_call_id;

static SipController* globalSipUa;

/* Callback called by the library upon receiving incoming call */
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

    if(globalSipUa)
    {

       SipController* sc = (SipController*)globalSipUa;
       QString info = "incoming: " + QString::fromLatin1(ci.remote_info.ptr, (int) ci.remote_info.slen);
       sc->setStatusMessage(info);
    }
}

/* Callback called by the library when call's state has changed */
void SipController::on_call_state(pjsua_call_id call_id, pjsip_event *e)
{
    pjsua_call_info ci;

    PJ_UNUSED_ARG(e);

    pjsua_call_get_info(call_id, &ci);

    if(globalSipUa)
    {
       SipController* sc = (SipController*)globalSipUa;
       QString state = "state: " + QString::fromLatin1(ci.state_text.ptr, (int) ci.state_text.slen);
       sc->setStatusMessage(state);
       //QString info = "info: " + QString::fromLatin1(ci.remote_info.ptr, (int) ci.remote_info.slen);
       //sc->setStatusMessage(info);
    }
}

/* Callback called by the library when call's media state has changed */
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

void SipController::on_call_tsx_state(pjsua_call_id call_id, pjsip_transaction *tsx, pjsip_event *e)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(tsx);
    PJ_UNUSED_ARG(e);
}

void SipController::on_call_sdp_created(pjsua_call_id call_id, pjmedia_sdp_session *sdp,
                                   pj_pool_t *pool, const pjmedia_sdp_session *rem_sdp)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(sdp);
    PJ_UNUSED_ARG(pool);
    PJ_UNUSED_ARG(rem_sdp);
}

void SipController::on_stream_created(pjsua_call_id call_id, pjmedia_stream *strm,
                                      unsigned stream_idx, pjmedia_port **p_port)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(strm);
    PJ_UNUSED_ARG(stream_idx);
    PJ_UNUSED_ARG(p_port);
}

void SipController::on_stream_destroyed(pjsua_call_id call_id, pjmedia_stream *strm, unsigned stream_idx)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(strm);
    PJ_UNUSED_ARG(stream_idx);
}

void SipController::on_dtmf_digit(pjsua_call_id call_id, int digit)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(digit);
}

void SipController::on_call_transfer_request(pjsua_call_id call_id, const pj_str_t *dst,
                                             pjsip_status_code *code)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(dst);
    PJ_UNUSED_ARG(code);
}

void SipController::on_call_transfer_request2(pjsua_call_id call_id, const pj_str_t *dst,
                                              pjsip_status_code *code, pjsua_call_setting *opt)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(dst);
    PJ_UNUSED_ARG(code);
    PJ_UNUSED_ARG(opt);
}

void SipController::on_call_transfer_status(pjsua_call_id call_id, int st_code,
                                            const pj_str_t *st_text, pj_bool_t final, pj_bool_t *p_cont)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(st_code);
    PJ_UNUSED_ARG(st_text);
    PJ_UNUSED_ARG(final);
    PJ_UNUSED_ARG(p_cont);
}

void SipController::on_call_replace_request(pjsua_call_id call_id, pjsip_rx_data *rdata,
                                            int *st_code, pj_str_t *st_text)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(rdata);
    PJ_UNUSED_ARG(st_code);
    PJ_UNUSED_ARG(st_text);
}

void SipController::on_call_replace_request2(pjsua_call_id call_id, pjsip_rx_data *rdata,
                                             int *st_code, pj_str_t *st_text, pjsua_call_setting *opt)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(rdata);
    PJ_UNUSED_ARG(st_code);
    PJ_UNUSED_ARG(st_text);
    PJ_UNUSED_ARG(opt);
}

void SipController::on_call_replaced(pjsua_call_id old_call_id, pjsua_call_id new_call_id)
{
    PJ_UNUSED_ARG(old_call_id);
    PJ_UNUSED_ARG(new_call_id);
}

void SipController::on_call_rx_offer(pjsua_call_id call_id, const pjmedia_sdp_session *offer,
                                     void *reserved, pjsip_status_code *code, pjsua_call_setting *opt)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(offer);
    PJ_UNUSED_ARG(reserved);
    PJ_UNUSED_ARG(code);
    PJ_UNUSED_ARG(opt);
}

void SipController::on_reg_started(pjsua_acc_id acc_id, pj_bool_t renew)
{
    PJ_UNUSED_ARG(acc_id);
    PJ_UNUSED_ARG(renew);
}

void SipController::on_reg_state(pjsua_acc_id acc_id)
{
    PJ_UNUSED_ARG(acc_id);
}

void SipController::on_reg_state2(pjsua_acc_id acc_id, pjsua_reg_info *info)
{
    PJ_UNUSED_ARG(acc_id);
    PJ_UNUSED_ARG(info);
}

void SipController::on_incoming_subscribe(pjsua_acc_id acc_id, pjsua_srv_pres *srv_pres,
                                          pjsua_buddy_id buddy_id, const pj_str_t *from,
                                          pjsip_rx_data *rdata, pjsip_status_code *code,
                                          pj_str_t *reason, pjsua_msg_data *msg_data)
{
    PJ_UNUSED_ARG(acc_id);
    PJ_UNUSED_ARG(srv_pres);
    PJ_UNUSED_ARG(buddy_id);
    PJ_UNUSED_ARG(from);
    PJ_UNUSED_ARG(rdata);
    PJ_UNUSED_ARG(code);
    PJ_UNUSED_ARG(reason);
    PJ_UNUSED_ARG(msg_data);
}

void SipController::on_srv_subscribe_state(pjsua_acc_id acc_id, pjsua_srv_pres *srv_pres,
                                           const pj_str_t *remote_uri, pjsip_evsub_state state,
                                           pjsip_event *event)
{
    PJ_UNUSED_ARG(acc_id);
    PJ_UNUSED_ARG(srv_pres);
    PJ_UNUSED_ARG(remote_uri);
    PJ_UNUSED_ARG(state);
    PJ_UNUSED_ARG(event);
}

void SipController::on_buddy_state(pjsua_buddy_id buddy_id)
{
    PJ_UNUSED_ARG(buddy_id);
}

void SipController::on_buddy_evsub_state(pjsua_buddy_id buddy_id, pjsip_evsub *sub, pjsip_event *event)
{
    PJ_UNUSED_ARG(buddy_id);
    PJ_UNUSED_ARG(sub);
    PJ_UNUSED_ARG(event);
}

void SipController::on_pager(pjsua_call_id call_id, const pj_str_t *from, const pj_str_t *to,
                             const pj_str_t *contact, const pj_str_t *mime_type, const pj_str_t *body)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(from);
    PJ_UNUSED_ARG(to);
    PJ_UNUSED_ARG(contact);
    PJ_UNUSED_ARG(mime_type);
    PJ_UNUSED_ARG(body);
}

void SipController::on_pager2(pjsua_call_id call_id, const pj_str_t *from, const pj_str_t *to,
                              const pj_str_t *contact, const pj_str_t *mime_type,
                              const pj_str_t *body, pjsip_rx_data *rdata, pjsua_acc_id acc_id)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(from);
    PJ_UNUSED_ARG(to);
    PJ_UNUSED_ARG(contact);
    PJ_UNUSED_ARG(mime_type);
    PJ_UNUSED_ARG(body);
    PJ_UNUSED_ARG(rdata);
    PJ_UNUSED_ARG(acc_id);
}

void SipController::on_pager_status(pjsua_call_id call_id, const pj_str_t *to, const pj_str_t *body,
                                    void *user_data, pjsip_status_code status, const pj_str_t *reason)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(to);
    PJ_UNUSED_ARG(body);
    PJ_UNUSED_ARG(user_data);
    PJ_UNUSED_ARG(status);
    PJ_UNUSED_ARG(reason);
}

void SipController::on_pager_status2(pjsua_call_id call_id, const pj_str_t *to, const pj_str_t *body,
                                     void *user_data, pjsip_status_code status, const pj_str_t *reason,
                                     pjsip_tx_data *tdata, pjsip_rx_data *rdata, pjsua_acc_id acc_id)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(to);
    PJ_UNUSED_ARG(body);
    PJ_UNUSED_ARG(user_data);
    PJ_UNUSED_ARG(status);
    PJ_UNUSED_ARG(reason);
    PJ_UNUSED_ARG(tdata);
    PJ_UNUSED_ARG(rdata);
    PJ_UNUSED_ARG(acc_id);
}

void SipController::on_typing(pjsua_call_id call_id, const pj_str_t *from, const pj_str_t *to,
                              const pj_str_t *contact, pj_bool_t is_typing)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(from);
    PJ_UNUSED_ARG(to);
    PJ_UNUSED_ARG(contact);
    PJ_UNUSED_ARG(is_typing);
}

void SipController::on_typing2(pjsua_call_id call_id, const pj_str_t *from, const pj_str_t *to,
                               const pj_str_t *contact, pj_bool_t is_typing, pjsip_rx_data *rdata,
                               pjsua_acc_id acc_id)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(from);
    PJ_UNUSED_ARG(to);
    PJ_UNUSED_ARG(contact);
    PJ_UNUSED_ARG(is_typing);
    PJ_UNUSED_ARG(rdata);
    PJ_UNUSED_ARG(acc_id);
}

void SipController::on_nat_detect(const pj_stun_nat_detect_result *res)
{
    PJ_UNUSED_ARG(res);
}

/*
pjsip_redirect_op SipController::on_call_redirected(pjsua_call_id call_id, const pjsip_uri *target,
                                                                const pjsip_event *e)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(target);
    PJ_UNUSED_ARG(e);
}
*/

void SipController::on_mwi_state(pjsua_acc_id acc_id, pjsip_evsub *evsub)
{
    PJ_UNUSED_ARG(acc_id);
    PJ_UNUSED_ARG(evsub);
}

void SipController::on_mwi_info(pjsua_acc_id acc_id, pjsua_mwi_info *mwi_info)
{
    PJ_UNUSED_ARG(acc_id);
    PJ_UNUSED_ARG(mwi_info);
}

/*
pjsip_tp_state_callback SipController::on_transport_state()
{

}
*/

/*
pjsua_med_tp_state_cb SipController::on_call_media_transport_state()
{

}
*/

void SipController::on_ice_transport_error(int index, pj_ice_strans_op op,
                                           pj_status_t status, void *param)
{
    PJ_UNUSED_ARG(index);
    PJ_UNUSED_ARG(op);
    PJ_UNUSED_ARG(status);
    PJ_UNUSED_ARG(param);
}

/*
pj_status_t SipController::on_snd_dev_operation(int operation)
{
    PJ_UNUSED_ARG(operation);
}
*/

void SipController::on_call_media_event(pjsua_call_id call_id, unsigned med_idx, pjmedia_event *event)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(med_idx);
    PJ_UNUSED_ARG(event);
}

/*
pjmedia_transport* SipController::on_create_media_transport(pjsua_call_id call_id, unsigned media_idx,
                                              pjmedia_transport *base_tp, unsigned flags)
{
    PJ_UNUSED_ARG(call_id);
    PJ_UNUSED_ARG(media_idx);
    PJ_UNUSED_ARG(base_tp);
    PJ_UNUSED_ARG(flags);
}
*/

void SipController::on_acc_find_for_incoming(const pjsip_rx_data *rdata, pjsua_acc_id *acc_id)
{
    PJ_UNUSED_ARG(rdata);
    PJ_UNUSED_ARG(acc_id);
}

//--------------------------------------------------------------------------------------------

SipController::SipController(QObject *parent)
    : QObject(parent)
    , _serverUrl("")
    , _user("")
    , _password("")
    , _buddy("")
    , _statusMessage("Ready")
{
    globalSipUa = this;
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
    emit statusMessageChanged(_statusMessage);
}

int SipController::create()
{
    status = pjsua_create();
    if (status != PJ_SUCCESS)
    {
        setStatusMessage("error create");
        return SC_ERROR;
    }
    //setStatusMessage("create pjsip - ok");
    return SC_OK;
}

int SipController::init()
{
    pjsua_config_default(&cfg);
    cfg.cb.on_incoming_call = &SipController::on_incoming_call;
    cfg.cb.on_call_media_state = &SipController::on_call_media_state;
    cfg.cb.on_call_state = &SipController::on_call_state;

    pjsua_logging_config_default(&log_cfg);
    log_cfg.console_level = 4;

    status = pjsua_init(&cfg, &log_cfg, NULL);
    if (status != PJ_SUCCESS)
    {
        setStatusMessage("error init");
        return SC_ERROR;
    }
    //setStatusMessage("init pjsip - ok");
    return SC_OK;
}

int SipController::destroy()
{
    pjsua_destroy();
    return SC_OK;
}

int SipController::addTransport()
{
    pjsua_transport_config cfg;

    pjsua_transport_config_default(&cfg);
    cfg.port = 5060;
    status = pjsua_transport_create(PJSIP_TRANSPORT_UDP, &cfg, NULL);
    if (status != PJ_SUCCESS)
    {
        setStatusMessage("error addTransport");
        return SC_ERROR;
    }
    //setStatusMessage("addTransport - ok");
    return SC_OK;
}

int SipController::start()
{
    status = pjsua_start();
    if (status != PJ_SUCCESS)
    {
        setStatusMessage("error start");
        return SC_ERROR;
    }
    //setStatusMessage("start - ok");
    return SC_OK;
}

int SipController::createSIPAccount()
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
    {
        setStatusMessage("error createSIPAccount");
        return SC_ERROR;
    }
    else
    {
        //setStatusMessage("create SIP Account - ok");
        return SC_OK;
    }
}

int SipController::makeCall()
{
    QString tmp = "sip:" + _buddy;
    char* cBuddy = new char[tmp.toLatin1().toStdString().length() + 1];
    strcpy(cBuddy, tmp.toLatin1().toStdString().c_str());

    pj_str_t uri = pj_str(cBuddy);
    //pj_str_t uri = pj_str("sip:pete@sip.whisperr.com");

    //delete[] cBuddy;

    status = pjsua_call_make_call(acc_id, &uri, 0, NULL, NULL, NULL);
    if (status != PJ_SUCCESS)
    {
        setStatusMessage("error calling");
        return SC_ERROR;
    }
    else
    {
        setStatusMessage("calling");
        return SC_OK;
    }
}

int SipController::acceptCall()
{
   // answer incoming calls with 200/OK
   pjsua_call_answer(current_call_id, 200, NULL, NULL);
   setStatusMessage("accepted");
   return SC_OK;
}

int SipController::rejectCall()
{
    pjsua_call_hangup(current_call_id, 0, NULL, NULL);
    setStatusMessage("rejected");
    return SC_OK;
}

int SipController::registered()
{
    if(create())
        return SC_ERROR;
    if(init())
        return SC_ERROR;
    if(addTransport())
        return SC_ERROR;
    if(start())
        return SC_ERROR;
    if(createSIPAccount())
        return SC_ERROR;

    setStatusMessage("registered");
    return SC_OK;
}
