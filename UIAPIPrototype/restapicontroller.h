#ifndef RESTAPICONTROLLER_H
#define RESTAPICONTROLLER_H

#include <QObject>

class HttpRequestWorker;

enum eLang
{

};

struct ServerResponse
{
    int code;
    QString message;
    QString token;
};

class restAPIcontroller : public QObject
{
    Q_OBJECT
public:
    explicit restAPIcontroller(QObject *parent = 0);
    ~restAPIcontroller();

signals:
    void responseMsg(QString msg);
public slots:

    // trigger the request
    void on_login(const QString& uid, const QString& pwd, const QString& lang, ServerResponse* response);
    void on_resetPassword(const QString& email, const QString& lang, ServerResponse* response);
    void on_signup(const QString& uid, const QString& pwd, const QString& lang, ServerResponse* response);
    void on_backup(const QString& token, const QString& pin, const QString& xml, const QString& lang, ServerResponse* response);
    void on_restore(const QString& token, const QString& pin, const QString& lang, ServerResponse* response);

    void handle_result(HttpRequestWorker *worker);

private:
    HttpRequestWorker* worker;
    ServerResponse* response; // pointer to the response struct, fill in the handle_result
};

#endif // RESTAPICONTROLLER_H
