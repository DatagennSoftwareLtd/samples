TEMPLATE = app

QT += qml quick enginio

android {
    QT += androidextras
}

SOURCES += main.cpp \
    facadeui.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    facadeui.h

DISTFILES += \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/style.xml \
    android/res/drawable/splash_screen.png

DISTFILES += \
    ./qml/init.qml \
    ./qml/main.qml \
    ./qml/ssload.qml \
    ./qml/whisperrSS.qml \


ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
