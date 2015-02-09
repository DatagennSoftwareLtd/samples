DEFINES -= UNICODE
TEMPLATE = app

QT += qml quick

SOURCES += main.cpp \
    sipcontroller.cpp

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

#win32-g++:
release{
LIBS += \
    -lpjlib-i386-win32-vc8-release \
    -lpjlib-util-i386-win32-vc8-release \
    -lpjsip-core-i386-win32-vc8-release \
    -lpjsip-simple-i386-win32-vc8-release \
    -lpjsip-ua-i386-win32-vc8-release \
    -lpjsua2-lib-i386-win32-vc8-release \
    -lpjsua-lib-i386-win32-vc8-release \
    -lpjnath-i386-win32-vc8-release \
    -lpjmedia-audiodev-i386-win32-vc8-release \
    -lpjmedia-codec-i386-win32-vc8-release \
    -lpjmedia-i386-win32-vc8-release \
    -lpjmedia-videodev-i386-win32-vc8-release \
    -llibbaseclasses-i386-win32-vc8-release \
    -llibg7221codec-i386-win32-vc8-release \
    -llibgsmcodec-i386-win32-vc8-release \
    -llibilbccodec-i386-win32-vc8-release \
    -llibmilenage-i386-win32-vc8-release \
    -llibportaudio-i386-win32-vc8-release \
    -llibresample-i386-win32-vc8-release \
    -llibspeex-i386-win32-vc8-release \
    -llibsrtp-i386-win32-vc8-release \
    -lwinmm \
    -lole32 \
    -lws2_32 \
    -lwsock32 \
    -lmsvcrt
    #/NODEFAULTLIB:msvcrt \
    #/NODEFAULTLIB:libcmt
}

debug{
LIBS += \
    -lpjlib-i386-win32-vc8-debug \
    -lpjlib-util-i386-win32-vc8-debug \
    -lpjsip-core-i386-win32-vc8-debug \
    -lpjsip-simple-i386-win32-vc8-debug \
    -lpjsip-ua-i386-win32-vc8-debug \
    -lpjsua2-lib-i386-win32-vc8-debug \
    -lpjsua-lib-i386-win32-vc8-debug \
    -lpjnath-i386-win32-vc8-debug \
    -lpjmedia-audiodev-i386-win32-vc8-debug \
    -lpjmedia-codec-i386-win32-vc8-debug \
    -lpjmedia-i386-win32-vc8-debug \
    -lpjmedia-videodev-i386-win32-vc8-debug \
    -llibbaseclasses-i386-win32-vc8-debug \
    -llibg7221codec-i386-win32-vc8-debug \
    -llibgsmcodec-i386-win32-vc8-debug \
    -llibilbccodec-i386-win32-vc8-debug \
    -llibmilenage-i386-win32-vc8-debug \
    -llibportaudio-i386-win32-vc8-debug \
    -llibresample-i386-win32-vc8-debug \
    -llibspeex-i386-win32-vc8-debug \
    -llibsrtp-i386-win32-vc8-debug \
    -lwinmm \
    -lole32 \
    -lws2_32 \
    -lwsock32\
    /NODEFAULTLIB:msvcrt \
    /NODEFAULTLIB:libcmtd
}


#QMAKE_CXXFLAGS += /MD
#QMAKE_CXXFLAGS += /MT

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    sipcontroller.h
