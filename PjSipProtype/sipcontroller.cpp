#include "sipcontroller.h"

/* Callback called by the library upon receiving incoming call */
static void on_incoming_call(pjsua_acc_id acc_id, pjsua_call_id call_id,
                 pjsip_rx_data *rdata)
{
    pjsua_call_info ci;

    PJ_UNUSED_ARG(acc_id);
    PJ_UNUSED_ARG(rdata);

    pjsua_call_get_info(call_id, &ci);

    /*
    PJ_LOG(3,(THIS_FILE, "Incoming call from %.*s!!",
             (int)ci.remote_info.slen,
             ci.remote_info.ptr));
    */

    /* Automatically answer incoming calls with 200/OK */
    pjsua_call_answer(call_id, 200, NULL, NULL);
}

/* Callback called by the library when call's state has changed */
static void on_call_state(pjsua_call_id call_id, pjsip_event *e)
{
    pjsua_call_info ci;

    PJ_UNUSED_ARG(e);

    pjsua_call_get_info(call_id, &ci);
    /*
    PJ_LOG(3,(THIS_FILE, "Call %d state=%.*s", call_id,
             (int)ci.state_text.slen,
             ci.state_text.ptr));
             */
}

/* Callback called by the library when call's media state has changed */
static void on_call_media_state(pjsua_call_id call_id)
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
    , _login("")
    , _password("")
{

}

SipController::~SipController()
{

}

void SipController::setLogin(const QString& l)
{
    if(_login == l)
        return;
    _login = l;
    emit loginChanged(l);
}

void SipController::setPassword(const QString& p)
{
    if(_password == p)
        return;
    _password = p;
    emit passwordChanged(p);
}

void SipController::create()
{
    status = pjsua_create();
    if (status != PJ_SUCCESS)
        ; // error!
}

void SipController::init()
{
    pjsua_config_default(&cfg);
    cfg.cb.on_incoming_call = &on_incoming_call;
    cfg.cb.on_call_media_state = &on_call_media_state;
    cfg.cb.on_call_state = &on_call_state;

    pjsua_logging_config_default(&log_cfg);
    log_cfg.console_level = 4;

    status = pjsua_init(&cfg, &log_cfg, NULL);
    if (status != PJ_SUCCESS)
        ;//error
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
        ; //error
}

void SipController::start()
{
    status = pjsua_start();
    if (status != PJ_SUCCESS)
        ; //error
}

void SipController::createSIPAccount()
{
    pjsua_acc_config cfg;

    pjsua_acc_config_default(&cfg);

    cfg.id = pj_str("sip:device1@sip.whisperr.com");
    cfg.reg_uri = pj_str("sip:sip.whisperr.com");
    cfg.cred_count = 1;
    cfg.cred_info[0].realm = pj_str("*");
    cfg.cred_info[0].scheme = pj_str("digest");
    cfg.cred_info[0].username = pj_str("device1");
    cfg.cred_info[0].data_type = PJSIP_CRED_DATA_PLAIN_PASSWD;
    cfg.cred_info[0].data = pj_str("device1");

    status = pjsua_acc_add(&cfg, PJ_TRUE, &acc_id);
    if (status != PJ_SUCCESS)
        ; //error
}

void SipController::makeCall()
{
    pj_str_t uri = pj_str("pete@sip.whisperr.com");
    status = pjsua_call_make_call(acc_id, &uri, 0, NULL, NULL, NULL);
    if (status != PJ_SUCCESS)
        ;// error
}
