#include "restapicontroller.h"
#include "httprequestworker.h"

static const QString url_str_login = "http://api.whisperr.com:8080/v1/login";
static const QString url_str_reset_password = "http://api.whisperr.com:8080/v1/resetPassword";
static const QString url_str_signup = "http://api.whisperr.com:8080/v1/signup";
static const QString url_str_backup = "http://api.whisperr.com:8080/v1/backup";
static const QString url_str_restore = "http://api.whisperr.com:8080/v1/restore";

restAPIcontroller::restAPIcontroller(QObject *parent) : QObject(parent)
{

}

restAPIcontroller::~restAPIcontroller()
{

}

void restAPIcontroller::handle_result(HttpRequestWorker *worker)
{
    QString msg;

    if (worker->error_type == QNetworkReply::NoError) {
        // communication was successful
        msg = "Success - Response: " + worker->response;
    }
    else {
        // an error occurred
        msg = "Error: " + worker->error_str;
    }

    emit responseMsg(msg);
}

void restAPIcontroller::on_login(const QString& uid, const QString& pwd, const QString& lang, ServerResponse& response)
{
    HttpRequestInput input(url_str_login, "POST");
    input.add_var("uid", uid);
    input.add_var("pwd", pwd);
    input.add_var("lang", lang);

    HttpRequestWorker *worker = new HttpRequestWorker(this);
    connect(worker, SIGNAL(on_execution_finished(HttpRequestWorker*)), this, SLOT(handle_result(HttpRequestWorker*)));
    worker->execute(&input);
}

void restAPIcontroller::on_resetPassword(const QString& email, const QString& lang, ServerResponse& response)
{
    HttpRequestInput input(url_str_reset_password, "POST");
    input.add_var("email", email);
    input.add_var("lang", lang);

    HttpRequestWorker *worker = new HttpRequestWorker(this);
    connect(worker, SIGNAL(on_execution_finished(HttpRequestWorker*)), this, SLOT(handle_result(HttpRequestWorker*)));
    worker->execute(&input);
}

void restAPIcontroller::on_signup(const QString& uid, const QString& pwd, const QString& lang, ServerResponse& response)
{
    HttpRequestInput input(url_str_signup, "POST");
    input.add_var("uid", uid);
    input.add_var("pwd", pwd);
    input.add_var("lang", lang);

    HttpRequestWorker *worker = new HttpRequestWorker(this);
    connect(worker, SIGNAL(on_execution_finished(HttpRequestWorker*)), this, SLOT(handle_result(HttpRequestWorker*)));
    worker->execute(&input);
}

void restAPIcontroller::on_backup(const QString& token, const QString& pin, const QString& xml, const QString& lang, ServerResponse& response)
{

}

void restAPIcontroller::on_restore(const QString& token, const QString& pin, const QString& lang, ServerResponse& response)
{

}

