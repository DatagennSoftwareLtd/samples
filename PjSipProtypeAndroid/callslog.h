#ifndef CALLSLOG_H
#define CALLSLOG_H

#include <QObject>

class CallsLog : public QObject
{
    Q_OBJECT
public:
    explicit CallsLog(QObject *parent = 0);
    ~CallsLog();

signals:

public slots:
};

#endif // CALLSLOG_H
