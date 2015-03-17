TEMPLATE = app

QT += core qml quick androidextras

SOURCES += main.cpp \
    notificationclient.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
#include(deployment.pri)

HEADERS += \
    notificationclient.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/src/com/whisperr/samples/NotificationClient.java \
    android/res/drawable/icon.png

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
