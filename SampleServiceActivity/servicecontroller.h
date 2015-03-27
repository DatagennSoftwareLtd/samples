#ifndef SERVICECONTROLLER_H
#define SERVICECONTROLLER_H

#include <QObject>

class ServiceController : public QObject
{
    Q_OBJECT
public:
    explicit ServiceController(QObject *parent = 0);
    ~ServiceController();

signals:

public slots:
    Q_INVOKABLE void startService();
    Q_INVOKABLE void stopService();

private:
    bool isRunning;
};

#endif // SERVICECONTROLLER_H
