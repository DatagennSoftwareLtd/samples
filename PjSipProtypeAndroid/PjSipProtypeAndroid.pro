
DEFINES -= UNICODE
#DEFINES PJ_AUTOCONF=1
#DEFINES += PJ_ANDROID=1
DEFINES += PJ_IS_BIG_ENDIAN=0
DEFINES += PJ_IS_LITTLE_ENDIAN=1

TEMPLATE = app

QT += qml quick \
    websockets \
    webchannel \
    widgets

qtHaveModule(webengine) {
        QT +=   webengine \
                webchannel
        DEFINES += QT_WEBVIEW_WEBENGINE_BACKEND
}


SOURCES += main.cpp \
    sipcontroller.cpp \
    utils.cpp

RESOURCES += qml.qrc

INCLUDEPATH += \
    ./pjproject-2.3/pjsip/include \
    ./pjproject-2.3/pjlib/include \
    ./pjproject-2.3/pjlib/src \
    ./pjproject-2.3/pjlib-util/include \
    ./pjproject-2.3/pjnath/include \
    ./pjproject-2.3/pjmedia/include

LIBS += \
    -L$$PWD/pjproject-2.3/pjlib/lib \
    -L$$PWD/pjproject-2.3/pjlib-util/lib \
    -L$$PWD/pjproject-2.3/pjnath/lib \
    -L$$PWD/pjproject-2.3/pjmedia/lib \
    -L$$PWD/pjproject-2.3/pjsip/lib \
    -L$$PWD/pjproject-2.3/third_party/lib

android {
LIBS += \
    -lc \
    -lgnustl_shared \
    -lgcc \
    -lm \
    -lpjsua2-arm-unknown-linux-androideabi \
    -lpjsua-arm-unknown-linux-androideabi \
    -lpjsip-simple-arm-unknown-linux-androideabi \
    -lpjsip-ua-arm-unknown-linux-androideabi \
    -lpjsip-arm-unknown-linux-androideabi \
    -lpjmedia-audiodev-arm-unknown-linux-androideabi \
    -lpjmedia-codec-arm-unknown-linux-androideabi \
    -lpjmedia-videodev-arm-unknown-linux-androideabi \
    -lpjmedia-arm-unknown-linux-androideabi \
    -lpjnath-arm-unknown-linux-androideabi \
    -lpjsdp-arm-unknown-linux-androideabi \
    -lpj-arm-unknown-linux-androideabi \
    -lpjlib-util-arm-unknown-linux-androideabi \
    -lg7221codec-arm-unknown-linux-androideabi \
    -lgsmcodec-arm-unknown-linux-androideabi \
    -lilbccodec-arm-unknown-linux-androideabi \
#    -lportaudio-arm-unknown-linux-androideabi \
    -lresample-arm-unknown-linux-androideabi \
    -lspeex-arm-unknown-linux-androideabi \
    -lsrtp-arm-unknown-linux-androideabi
#    -lpthread \
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    sipcontroller.h \
    utils.h

DISTFILES += \
    init.qml \
    main.qml \
    splashscreen.qml \
    customprogressbar.qml

DISTFILES += \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
