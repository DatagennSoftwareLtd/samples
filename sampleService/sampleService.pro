TEMPLATE = app

QT += qml quick androidextras

CONFIG   += console
CONFIG   -= app_bundle

SOURCES += main.cpp \
    android/jni/QtAndroidService.cpp \
    servicecontroller.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/res/layout/serviceconfigactivity.xml \
    android/res/drawable/icon.png \
    android/res/drawable/notificon.png \
    android/res/values/dimens.xml \
    android/res/values/style.xml \
    android/jni/Android.mk \
    android/libs/guava-10.0.1.jar \
    android/src/com/whisperr/samples/sampleService.java \
    android/src/com/whisperr/samples/sampleServiceActivity.java \
    android/src/com/whisperr/samples/sampleServiceBroadcastReceiver.java \
    android/src/org/qtproject/qt5/android/QtServiceDelegate.java \
    android/src/org/qtproject/qt5/android/addons/qtserviceapp/QtService.java \
    android/src/org/qtproject/qt5/android/addons/qtserviceapp/QtServiceActivity.java \
    android/src/org/qtproject/qt5/android/addons/qtserviceapp/QtServiceBroadcastReceiver.java \
    android/src/com/whisperr/samples/ServiceClient.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    servicecontroller.h
