/****************************************************************************
**
** Copyright (C) 2014 Klarälvdalens Datakonsult AB, a KDAB Group company, info@kdab.com, author Milian Wolff <milian.wolff@kdab.com>
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtWebChannel module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL21$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia. For licensing terms and
** conditions see http://qt.digia.com/licensing. For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 or version 3 as published by the Free
** Software Foundation and appearing in the file LICENSE.LGPLv21 and
** LICENSE.LGPLv3 included in the packaging of this file. Please review the
** following information to ensure the GNU Lesser General Public License
** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights. These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef ChatServer_H
#define ChatServer_H

#include <QObject>
#include <QStringList>

QT_BEGIN_NAMESPACE

class QTimer;

class ChatServer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QStringList userList READ userList NOTIFY userListChanged)

public:
    explicit ChatServer(QObject *parent = 0);
    virtual ~ChatServer();

public:
    //a user logs in with the given username
    Q_INVOKABLE bool login(const QString& userName);

    //the user logs out, will be removed from userlist immediately
    Q_INVOKABLE bool logout(const QString& userName);

    //a user sends a message to all other users
    Q_INVOKABLE bool sendMessage(const QString& user, const QString& msg);

    //response of the keep alive signal from a client.
    // This is used to detect disconnects.
    Q_INVOKABLE void keepAliveResponse(const QString& user);

    QStringList userList() const;

protected slots:
    void sendKeepAlive();
    void checkKeepAliveResponses();

signals:
    void newMessage(QString time, QString user, QString msg);
    void keepAlive();
    void userListChanged();
    void userCountChanged();

private:
    QStringList m_userList;
    QStringList m_stillAliveUsers;
    QTimer* m_keepAliveCheckTimer;
};

#include <QDialog>
#include "ui_dialog.h"

/*!
    An instance of this class gets published over the WebChannel and is then accessible to HTML clients.
*/
class Dialog : public QObject
{
    Q_OBJECT

public:
    explicit Dialog(QObject *parent = 0)
        : QObject(parent)
    {
        ui.setupUi(&dialog);
        dialog.show();

        connect(ui.send, SIGNAL(clicked()), SLOT(clicked()));
    }

    void displayMessage(const QString &message)
    {
        ui.output->appendPlainText(message);
    }

signals:
    /*!
        This signal is emitted from the C++ side and the text displayed on the HTML client side.
    */
    void sendText(const QString &text);

public slots:
    /*!
        This slot is invoked from the HTML client side and the text displayed on the server side.
    */
    void receiveText(const QString &text)
    {
        displayMessage(tr("Received message: %1").arg(text));
    }

private slots:
    /*!
        Note that this slot is private and thus not accessible to HTML clients.
    */
    void clicked()
    {
        const QString text = ui.input->text();

        if (text.isEmpty()) {
            return;
        }

        emit sendText(text);
        displayMessage(tr("Sent message: %1").arg(text));

        ui.input->clear();
    }

private:
    QDialog dialog;
    Ui::Dialog ui;
};

QT_END_NAMESPACE

#endif // ChatServer_H
