
DISTFILES += \
    main.qml \

RESOURCES += \
    qml.qrc \

SOURCES += \
    main.cpp \

QT += quick \
    svg \
    xml \

qtHaveModule(webengine) {
        QT += webengine
        DEFINES += QT_WEBVIEW_WEBENGINE_BACKEND
}

HEADERS += \
    utils.h
