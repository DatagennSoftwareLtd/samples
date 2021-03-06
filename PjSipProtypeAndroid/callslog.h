#ifndef CALLSLOG_H
#define CALLSLOG_H

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

class CallsLog : public QObject
{
    Q_OBJECT
public:
    explicit CallsLog(QObject *parent = 0);
    ~CallsLog();

signals:

public slots:

    void addCallInfo(const SCallInfo&);
    void getCallInfo();
};

#endif // CALLSLOG_H
