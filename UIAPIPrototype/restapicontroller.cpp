#include "restapicontroller.h"
#include "httprequestworker.h"

#include <QJsonArray>
#include <QJsonObject>
#include <QJsonParseError>

static const QString url_str_login = "http://api.whisperr.com:8080/v1/login";
static const QString url_str_reset_password = "http://api.whisperr.com:8080/v1/resetPassword";
static const QString url_str_signup = "http://api.whisperr.com:8080/v1/signup";
static const QString url_str_backup = "http://api.whisperr.com:8080/v1/backup";
static const QString url_str_restore = "http://api.whisperr.com:8080/v1/restore";

restAPIcontroller::restAPIcontroller(QObject *parent) : QObject(parent)
{
    worker = new HttpRequestWorker(this);
    connect(worker, SIGNAL(on_execution_finished(HttpRequestWorker*)), this, SLOT(handle_result(HttpRequestWorker*)));
}

restAPIcontroller::~restAPIcontroller()
{

}
#include <QtDebug>
void restAPIcontroller::handle_result(HttpRequestWorker *worker)
{
    QString msg;

    if (worker->error_type == QNetworkReply::NoError) {
        // communication was successful
        emit responseMsg("Success - Response: " + worker->response);
        QJsonParseError err;
        QJsonDocument doc = QJsonDocument::fromJson(worker->response, &err);
        if(doc.isObject())
        {
            QJsonObject obj = doc.object();
            QJsonObject::iterator itr = obj.find("token");
            if(itr != obj.end())
            {
                qDebug() << response;
                //ServerResponse *response = new ServerResponse();
                //response->token = (*itr).toString();
                emit responseMsg("token: " + (*itr).toString());
            }
            else
                emit responseMsg("no token in the response, wrong format?");

            if(obj["responses"].isArray())
            {
                QJsonArray arr = obj["responses"].toArray();
                if(arr.size())
                {
                    QJsonValue val = arr[0];
                    if(val.isObject())
                    {
                        QJsonObject obj2 = val.toObject();
                        if(obj2["code"].isDouble())
                        {
                           // response->code = obj2["code"].toInt();
                            emit responseMsg(QString("code: %1").arg(obj2["code"].toInt()));
                        }
                        if(obj2["message"].isString())
                        {
                           // response->message = obj2["message"].toString();
                            emit responseMsg("message: " + obj2["message"].toString());
                        }
                    }
                }
                else
                    emit responseMsg("response field is empty, wrong format?");
            }
        }
        //msg = QString("token = %1, code = %2 (%3)").arg(response->token)
          //      .arg(response->code).arg(response->message);
    }
    else {
        // an error occurred
        msg = "Error: " + worker->error_str;
    }

    emit responseMsg(msg);
}

void restAPIcontroller::on_login(const QString& uid, const QString& pwd, const QString& lang, ServerResponse* sr)
{
    HttpRequestInput input(url_str_login, "POST");
    input.add_var("uid", uid);
    input.add_var("pwd", pwd);
    input.add_var("lang", lang);

    response = sr;
    worker->execute(&input);
}

void restAPIcontroller::on_resetPassword(const QString& email, const QString& lang, ServerResponse* sr)
{
    HttpRequestInput input(url_str_reset_password, "POST");
    input.add_var("email", email);
    input.add_var("lang", lang);

    response = sr;
    worker->execute(&input);
}

void restAPIcontroller::on_signup(const QString& uid, const QString& pwd, const QString& lang, ServerResponse* sr)
{
    HttpRequestInput input(url_str_signup, "POST");
    input.add_var("uid", uid);
    input.add_var("pwd", pwd);
    input.add_var("lang", lang);

    response = sr;
    worker->execute(&input);
}

void restAPIcontroller::on_backup(const QString& token, const QString& pin, const QString& xml, const QString& lang, ServerResponse* response)
{

}

void restAPIcontroller::on_restore(const QString& token, const QString& pin, const QString& lang, ServerResponse* response)
{

}

