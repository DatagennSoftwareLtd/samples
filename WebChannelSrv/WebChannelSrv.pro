
QT       += core \
            gui \
            websockets \
            webchannel

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = WebChannelSrv
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    websocketclientwrapper.cpp \
    websockettransport.cpp \
    chatserver.cpp

HEADERS  += mainwindow.h \
    websocketclientwrapper.h \
    websockettransport.h \
    chatserver.h

FORMS    += mainwindow.ui \
    dialog.ui

DEFINES += "BUILD_DIR=\"\\\""$$OUT_PWD"\\\"\""

CONFIG += mobility
MOBILITY = 

