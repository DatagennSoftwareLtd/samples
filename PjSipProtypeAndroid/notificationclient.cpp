
#include "notificationclient.h"

#include <QtDebug>
#include <QtAndroidExtras/QAndroidJniObject>

NotificationClient::NotificationClient(QObject *parent)
    : QObject(parent)
{
    connect(this, SIGNAL(notificationChanged()), this, SLOT(updateAndroidNotification()));
}

void NotificationClient::setNotification(const QString &notification)
{
    if (m_notification == notification)
        return;

    m_notification = notification;
    emit notificationChanged();
}

QString NotificationClient::notification() const
{
    return m_notification;
}

void NotificationClient::updateAndroidNotification()
{
    QAndroidJniObject javaNotification = QAndroidJniObject::fromString(m_notification);

    QAndroidJniObject::callStaticMethod<void>("com/whisperr/sample/MySampleService",
                                       "notify",
                                       "(Ljava/lang/String;)V",
                                       javaNotification.object<jstring>());
}

void NotificationClient::setIMNotification(const QString &from, const QString &msg)
{
    QAndroidJniObject javaNotification1 = QAndroidJniObject::fromString(from);
    QAndroidJniObject javaNotification2 = QAndroidJniObject::fromString(msg);

    QAndroidJniObject::callStaticMethod<void>("com/whisperr/sample/MySampleService",
                                       "notifyIM",
                                       "(Ljava/lang/String;Ljava/lang/String;)V",
                                       javaNotification1.object<jstring>(),
                                       javaNotification2.object<jstring>());
}
