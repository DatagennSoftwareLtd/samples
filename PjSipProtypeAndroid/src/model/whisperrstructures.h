#ifndef WHISPERRSTRUCTURES
#define WHISPERRSTRUCTURES

#include <QObject>

typedef quint32 callID32;
typedef quint32 chatID32;
typedef quint32 messageID32;
typedef quint32 tokenID32;
typedef quint32 contactID32;


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
    QString name ; // their name/group name,
    QString picture; // their picture/group picture,
    QString date;
    QString time;
    QString direction; //(in/out)
    QString message;
    QString type; //(conversation|group)
};

#endif // WHISPERRSTRUCTURES

