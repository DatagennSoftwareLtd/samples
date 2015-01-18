
DISTFILES += \
    main.qml \

RESOURCES += \
    qml.qrc \

SOURCES += \
    main.cpp \
    utils.cpp

QT += quick \
    svg \
    xml \
    websockets \
    webchannel \

qtHaveModule(webengine) {
        QT +=   webengine \
                webchannel
        DEFINES += QT_WEBVIEW_WEBENGINE_BACKEND
}

HEADERS += \
    utils.h
