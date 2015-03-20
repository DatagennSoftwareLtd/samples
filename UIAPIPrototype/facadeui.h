#ifndef FACADEUI_H
#define FACADEUI_H

#include <QObject>

typedef quint32 callID32;
typedef quint32 chatID32;
typedef quint32 messageID32;
typedef quint32 tokenID32;
typedef quint32 contactID32;

enum eDirection {
    inDirection = 0,
    outDirection = 1,
};

// call info for callLog getCallLogs
// sorted by date&time, newest first

struct SCallInfo
{
    callID32 callId;
    QString direction; //(in/out)
    QString name;
    QString number;
    QString picture;
    QString myNumber;
    QString date;
    QString time;
    QString callDuration;
};

// Call Details for getCallDetails
// sorted by date&time, newest first

struct SCallDetails
{
    QString direction; //(in/out)
    QString name;
    QString number;
    QString picture;
    QString myNumber;
    QString date;
    QString time;
    QString callDuration;
};

// getChatsList
// sorted by date&time, newest first
struct SChatInfo
{
    chatID32 chatId;
    QString name ; // their name/group name,
    QString picture; // their picture/group picture,
    QString date;
    QString time;
    QString direction; //(in/out)
    QString message;
    QString type; //(conversation|group)
};

// getMessages
// sorted by date&time, newest first
struct SMessageInfo
{
    messageID32 messageId;
    QString name ;          // their name/group name,
    QString picture;        // their picture/group picture,
    QString date;
    QString time;
    QString direction;      //(in/out)
    QString message;
    QString type;           //(conversation|group)
};


enum {
    RETURN_OK = 100,
};

class restAPIcontroller;
class ServerResponse;

class FacadeUI : public QObject
{
    Q_OBJECT
public:
    explicit FacadeUI(QObject *parent = 0);
    ~FacadeUI();

signals:
    void statusMessageChanged(const QString msg);

public slots:
    Q_INVOKABLE int login(const QString& username, const QString& password, const QString& lang);
    Q_INVOKABLE int resetPassword(const QString& emailAddress, const QString& lang);
    Q_INVOKABLE int signup(const QString& username, const QString& password, const QString& lang);
    Q_INVOKABLE int backup(const QString& token, const QString& pin, const QString& xml, const QString& lang);
    Q_INVOKABLE int restore(const QString& token, const QString& pin, const QString& lang);

    Q_INVOKABLE int logoff();

    void message(const QString msg);

private:
    restAPIcontroller* contr;
    ServerResponse* sr;
};

#endif // FACADEUI_H
