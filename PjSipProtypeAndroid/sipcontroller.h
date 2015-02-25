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
    QString user() const { return _user; }
    QString password() const { return _password; }
    QString buddy() const { return _buddy; }

    QString statusMessage() const { return _statusMessage; }
    void setStatusMessage(const QString&);

public slots:
    void setServerUrl(const QString&);
    void setUser(const QString&);
    void setPassword(const QString&);
    void setBuddy(const QString&);

signals:
    void serverUrlChanged(const QString);
    void userChanged(const QString);
    void passwordChanged(const QString);
    void buddyChanged(const QString);
    void statusMessageChanged(const QString);

    void incommingCall();

public slots:

    Q_INVOKABLE int create();
    Q_INVOKABLE int init();
    Q_INVOKABLE int destroy();

    Q_INVOKABLE int addTransport();
    Q_INVOKABLE int start();
    Q_INVOKABLE int createSIPAccount();

    Q_INVOKABLE int makeCall();

    Q_INVOKABLE int acceptCall();
    Q_INVOKABLE int rejectCall();

    Q_INVOKABLE int registered();

protected:

    // PjSip callbacks

    // Notify application when call state has changed
    static void on_call_state(pjsua_call_id call_id, pjsip_event *e);

    // Notify application on incoming call
    static void on_incoming_call(pjsua_acc_id acc_id, pjsua_call_id call_id,
                     pjsip_rx_data *rdata);

    // This is a general notification callback which is called whenever a transaction
    // within the call has changed state. Application can implement this callback for
    // example to monitor the state of outgoing requests, or to answer unhandled
    // incoming requests (such as INFO) with a final response.
    static void on_call_tsx_state(pjsua_call_id call_id, pjsip_transaction *tsx, pjsip_event *e);

    // Notify application when media state in the call has changed. Normal application would
    // need to implement this callback, e.g. to connect the call's media to sound device.
    // When ICE is used, this callback will also be called to report ICE negotiation failure.
    static void on_call_media_state(pjsua_call_id call_id);

    // Notify application when a call has just created a local SDP (for initial or subsequent SDP
    // offer/answer). Application can implement this callback to modify the SDP, before it is being
    // sent and/or negotiated with remote SDP, for example to apply per account/call basis codecs
    // priority or to add custom/proprietary SDP attributes.
    static void on_call_sdp_created(pjsua_call_id call_id, pjmedia_sdp_session *sdp,
                                    pj_pool_t *pool, const pjmedia_sdp_session *rem_sdp);

    // Notify application when media session is created and before it is registered to the
    // conference bridge. Application may return different media port if it has added media
    // processing port to the stream. This media port then will be added to the conference bridge instead.
    static void on_stream_created(pjsua_call_id call_id, pjmedia_stream *strm,
                                  unsigned stream_idx, pjmedia_port **p_port);

    // Notify application when media session has been unregistered from the conference bridge
    // and about to be destroyed.
    static void on_stream_destroyed(pjsua_call_id call_id, pjmedia_stream *strm, unsigned stream_idx);

    // Notify application upon incoming DTMF digits.
    static void on_dtmf_digit(pjsua_call_id call_id, int digit);

    // Notify application on call being transferred (i.e. REFER is received). Application can decide
    // to accept/reject transfer request by setting the code (default is 202). When this callback is
    // not defined, the default behavior is to accept the transfer. See also on_call_transfer_request2()
    // callback for the version with pjsua_call_setting in the argument list.
    static void on_call_transfer_request(pjsua_call_id call_id, const pj_str_t *dst, pjsip_status_code *code);

    // Notify application on call being transferred (i.e. REFER is received). Application can decide to
    // accept/reject transfer request by setting the code (default is 202). When this callback is not
    // defined, the default behavior is to accept the transfer.
    static void on_call_transfer_request2(pjsua_call_id call_id, const pj_str_t *dst,
                                           pjsip_status_code *code, pjsua_call_setting *opt);

    // Notify application of the status of previously sent call transfer request. Application can
    // monitor the status of the call transfer request, for example to decide whether to terminate
    // existing call.
    static void on_call_transfer_status(pjsua_call_id call_id, int st_code,
                                        const pj_str_t *st_text, pj_bool_t final, pj_bool_t *p_cont);

    // Notify application about incoming INVITE with Replaces header. Application may reject the
    // request by setting non-2xx code. See also on_call_replace_request2() callback for the
    // version with pjsua_call_setting in the argument list.
    static void on_call_replace_request(pjsua_call_id call_id, pjsip_rx_data *rdata,
                                        int *st_code, pj_str_t *st_text);

    // Notify application about incoming INVITE with Replaces header. Application may reject
    // the request by setting non-2xx code.
    static void on_call_replace_request2(pjsua_call_id call_id, pjsip_rx_data *rdata,
                                         int *st_code, pj_str_t *st_text, pjsua_call_setting *opt);

    // Notify application that an existing call has been replaced with a new call.
    // This happens when PJSUA-API receives incoming INVITE request with Replaces header.
    // After this callback is called, normally PJSUA-API will disconnect old_call_id
    // and establish new_call_id.
    static void on_call_replaced(pjsua_call_id old_call_id, pjsua_call_id new_call_id);

    // Notify application when call has received new offer from remote (i.e. re-INVITE/UPDATE with SDP
    // is received). Application can decide to accept/reject the offer by setting the code
    // (default is 200). If the offer is accepted, application can update the call setting to be
    // applied in the answer. When this callback is not defined, the default behavior is to accept
    // the offer using current call setting.
    static void on_call_rx_offer(pjsua_call_id call_id, const pjmedia_sdp_session *offer,
                                 void *reserved, pjsip_status_code *code, pjsua_call_setting *opt);

    // Notify application when registration or unregistration has been initiated. Note that this only
    // notifies the initial registration and unregistration. Once registration session is active,
    // subsequent refresh will not cause this callback to be called.
    static void on_reg_started(pjsua_acc_id acc_id, pj_bool_t renew);

    // Notify application when registration status has changed. Application may then query the
    // account info to get the registration details.
    static void on_reg_state(pjsua_acc_id acc_id);

    // Notify application when registration status has changed. Application may inspect the
    // registration info to get the registration status details.
    static void on_reg_state2(pjsua_acc_id acc_id, pjsua_reg_info *info);

    // Notification when incoming SUBSCRIBE request is received. Application may use this callback
    // to authorize the incoming subscribe request (e.g. ask user permission if the request should
    // be granted).
    // If this callback is not implemented, all incoming presence subscription requests will be accepted.
    // If this callback is implemented, application has several choices on what to do with
    // the incoming request:
    //    it may reject the request immediately by specifying non-200 class final response
    //      in the code argument.
    //    it may immediately accept the request by specifying 200 as the code argument. This is
    //      the default value if application doesn't set any value to the code argument. In this case,
    //      the library will automatically send NOTIFY request upon returning from this callback.
    //    it may delay the processing of the request, for example to request user permission
    //      whether to accept or reject the request. In this case, the application MUST set the code
    //      argument to 202, then IMMEDIATELY calls pjsua_pres_notify() with state
    //      PJSIP_EVSUB_STATE_PENDING and later calls pjsua_pres_notify() again to accept or reject
    //      the subscription request.
    //
    // Any code other than 200 and 202 will be treated as 200.
    // Application MUST return from this callback immediately (e.g. it must not block in this callback
    // while waiting for user confirmation).
    static void on_incoming_subscribe(pjsua_acc_id acc_id, pjsua_srv_pres *srv_pres,
                                      pjsua_buddy_id buddy_id, const pj_str_t *from,
                                      pjsip_rx_data *rdata, pjsip_status_code *code,
                                      pj_str_t *reason, pjsua_msg_data *msg_data);

    // Notification when server side subscription state has changed. This callback is optional as
    // application normally does not need to do anything to maintain server side presence subscription.
    static void on_srv_subscribe_state(pjsua_acc_id acc_id, pjsua_srv_pres *srv_pres,
                                       const pj_str_t *remote_uri, pjsip_evsub_state state,
                                       pjsip_event *event);

    // Notify application when the buddy state has changed. Application may then query
    // the buddy into to get the details.
    static void on_buddy_state(pjsua_buddy_id buddy_id);

    // Notify application when the state of client subscription session associated with a buddy
    // has changed. Application may use this callback to retrieve more detailed information about
    // the state changed event.
    static void on_buddy_evsub_state(pjsua_buddy_id buddy_id, pjsip_evsub *sub, pjsip_event *event);

    // Notify application on incoming pager (i.e. MESSAGE request). Argument call_id will be -1
    // if MESSAGE request is not related to an existing call.
    // See also on_pager2() callback for the version with pjsip_rx_data passed as one of the argument.
    static void on_pager(pjsua_call_id call_id, const pj_str_t *from, const pj_str_t *to,
                         const pj_str_t *contact, const pj_str_t *mime_type, const pj_str_t *body);

    // This is the alternative version of the on_pager() callback with pjsip_rx_data argument.
    static void on_pager2(pjsua_call_id call_id, const pj_str_t *from, const pj_str_t *to,
                          const pj_str_t *contact, const pj_str_t *mime_type,
                          const pj_str_t *body, pjsip_rx_data *rdata, pjsua_acc_id acc_id);

    // Notify application about the delivery status of outgoing pager request. See also
    // on_pager_status2() callback for the version with pjsip_rx_data in the argument list.
    static void on_pager_status(pjsua_call_id call_id, const pj_str_t *to, const pj_str_t *body,
                                void *user_data, pjsip_status_code status, const pj_str_t *reason);

    // Notify application about the delivery status of outgoing pager request.
    static void on_pager_status2(pjsua_call_id call_id, const pj_str_t *to, const pj_str_t *body,
                                 void *user_data, pjsip_status_code status, const pj_str_t *reason,
                                 pjsip_tx_data *tdata, pjsip_rx_data *rdata, pjsua_acc_id acc_id);

    // Notify application about typing indication.
    static void on_typing(pjsua_call_id call_id, const pj_str_t *from, const pj_str_t *to,
                          const pj_str_t *contact, pj_bool_t is_typing);

    // Notify application about typing indication.
    static void on_typing2(pjsua_call_id call_id, const pj_str_t *from, const pj_str_t *to,
                           const pj_str_t *contact, pj_bool_t is_typing, pjsip_rx_data *rdata,
                           pjsua_acc_id acc_id);

    // Callback when the library has finished performing NAT type detection.
    static void on_nat_detect(const pj_stun_nat_detect_result *res);

    // This callback is called when the call is about to resend the INVITE request to the specified
    // target, following the previously received redirection response.
    // Application may accept the redirection to the specified target, reject this target only and
    // make the session continue to try the next target in the list if such target exists,
    // stop the whole redirection process altogether and cause the session to be disconnected,
    // or defer the decision to ask for user confirmation.
    // This callback is optional. If this callback is not implemented, the default behavior is
    // to NOT follow the redirection response.
    //
    //static pjsip_redirect_op on_call_redirected(pjsua_call_id call_id, const pjsip_uri *target,
    //                                            const pjsip_event *e);

    // This callback is called when message waiting indication subscription state has changed.
    // Application can then query the subscription state by calling pjsip_evsub_get_state().
    static void on_mwi_state(pjsua_acc_id acc_id, pjsip_evsub *evsub);

    // This callback is called when a NOTIFY request for message summary / message waiting
    // indication is received.
    static void on_mwi_info(pjsua_acc_id acc_id, pjsua_mwi_info *mwi_info);

    // This callback is called when transport state is changed. See also pjsip_tp_state_callback.
    //
    //static pjsip_tp_state_callback on_transport_state();

    // This callback is called when media transport state is changed. See also pjsua_med_tp_state_cb.
    //
    //static pjsua_med_tp_state_cb on_call_media_transport_state();

    // This callback is called to report error in ICE media transport.
    // Currently it is used to report TURN Refresh error.
    static void on_ice_transport_error(int index, pj_ice_strans_op op, pj_status_t status, void *param);

    // Callback when the sound device is about to be opened or closed. This callback will be called
    // even when null sound device or no sound device is configured by the application
    // (i.e. the pjsua_set_null_snd_dev() and pjsua_set_no_snd_dev() APIs). This API is mostly useful
    // when the application wants to manage the sound device by itself (i.e. with pjsua_set_no_snd_dev()),
    // to get notified when it should open or close the sound device.
    //
    //static pj_status_t on_snd_dev_operation(int operation);

    // Notification about media events such as video notifications. This callback will most likely
    // be called from media threads, thus application must not perform heavy processing in this callback.
    // Especially, application must not destroy the call or media in this callback. If application
    // needs to perform more complex tasks to handle the event, it should post the task to another thread.
    static void on_call_media_event(pjsua_call_id call_id, unsigned med_idx, pjmedia_event *event);

    // This callback can be used by application to implement custom media transport adapter for the call,
    // or to replace the media transport with something completely new altogether.
    // This callback is called when a new call is created. The library has created a media transport
    // for the call, and it is provided as the base_tp argument of this callback. Upon returning,
    // the callback must return an instance of media transport to be used by the call.
    //
    //static pjmedia_transport* on_create_media_transport(pjsua_call_id call_id, unsigned media_idx,
    //                                                    pjmedia_transport *base_tp, unsigned flags);

    // This callback can be used by application to override the account to be used to handle an
    // incoming message. Initially, the account to be used will be calculated automatically by the
    // library. This initial account will be used if application does not implement this callback,
    // or application sets an invalid account upon returning from this callback.
    // Note that currently the incoming messages requiring account assignment are INVITE, MESSAGE,
    // SUBSCRIBE, and unsolicited NOTIFY. This callback may be called before the callback of the
    // SIP event itself, i.e: incoming call, pager, subscription, or unsolicited-event.
    static void on_acc_find_for_incoming(const pjsip_rx_data *rdata, pjsua_acc_id *acc_id);

public:
    static SipController* _contr;

private:

    enum {
        SC_OK = 0,
        SC_ERROR,
    };

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
