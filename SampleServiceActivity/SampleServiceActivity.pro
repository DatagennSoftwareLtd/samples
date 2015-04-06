TEMPLATE = app

QT += core qml quick

android {
    QT += androidextras
}

SOURCES += main.cpp \
    servicecontroller.cpp

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
    android/jni/Android.mk \
    android/res/drawable/icon.png \
    android/res/drawable/notificon.png \
    android/res/layout/serviceconfigactivity.xml \
    android/res/values/dimens.xml \
    android/res/values/style.xml \
    android/src/com/whisperr/sample/MySampleActivity.java \
    android/src/com/whisperr/sample/MySampleService.java \
    android/src/org/qtproject/qt5/android/addons/qtactivityapp/QtService.java \
    android/src/org/qtproject/qt5/android/addons/qtactivityapp/QtServiceActivity.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    servicecontroller.h
