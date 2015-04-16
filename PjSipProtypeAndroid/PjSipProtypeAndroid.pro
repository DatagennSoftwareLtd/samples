
DEFINES -= UNICODE
#DEFINES PJ_AUTOCONF=1
#DEFINES += PJ_ANDROID=1
DEFINES += PJ_IS_BIG_ENDIAN=0
DEFINES += PJ_IS_LITTLE_ENDIAN=1

TEMPLATE = app

QT += qml quick \
    websockets \
    webchannel \
    widgets \
    core \
    enginio \
    sql

android {
    QT += androidextras
}

qtHaveModule(webengine) {
        QT +=   webengine \
                webchannel
        DEFINES += QT_WEBVIEW_WEBENGINE_BACKEND
}


SOURCES += main.cpp \
    sipcontroller.cpp \
    utils.cpp \
    bridgejs.cpp \
    notificationclient.cpp \
    callslog.cpp \
    src/db/provider/dbprovider.cpp \
    src/db/accounts/accountitem.cpp \
    src/db/accounts/accountsmodel.cpp \
    src/db/contacts/contactitem.cpp \
    src/db/contacts/contactsmodel.cpp \
    src/db/logs/messagemodel.cpp \
    src/db/logs/messageitem.cpp

RESOURCES += \
    qml.qrc

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
    utils.h \
    bridgejs.h \
    notificationclient.h \
    callslog.h \
    src/db/provider/dbprovider.h \
    src/db/accounts/accountitem.h \
    src/db/accounts/accountsmodel.h \
    src/db/contacts/contactitem.h \
    src/db/contacts/contactsmodel.h \
    src/db/logs/messagemodel.h \
    src/db/logs/messageitem.h \
    src/model/whisperrstructures.h

DISTFILES += \
    ./qml/init.qml \
    ./qml/main.qml \
    ./qml/mainoffline.qml \
    ./qml/splashscreen.qml \
    ./qml/customprogressbar.qml \
    ./qml/collapsiblepanel.qml \
    ./qml/navigationdrawer.qml \
    ./qml/settingstab.qml \
    ./qml/callstab.qml \
    ./qml/messagestab.qml \
    android/src/com/whisperr/sample/MySampleActivity.java \
    android/src/com/whisperr/sample/MySampleService.java \
    android/src/org/qtproject/qt5/android/addons/qtactivityapp/QtService.java \
    android/src/org/qtproject/qt5/android/addons/qtactivityapp/QtServiceActivity.java \
    android/jni/Android.mk \
    android/libs/guava-10.0.1.jar \
    android/res/drawable/icon_hq.png \
    android/res/drawable/icon_lq.png \
    android/res/drawable/icon_mq.png \
    android/res/drawable/notificon.png \
    android/res/layout/serviceconfigactivity.xml \
    android/res/values/dimens.xml \
    android/res/values/style.xml

DISTFILES += \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
