TEMPLATE = app

QT += qml quick androidextras

SOURCES += main.cpp \
    notificationclient.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/src/com/mycompany/NotificationClient.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    notificationclient.h
