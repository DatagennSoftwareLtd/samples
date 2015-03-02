TEMPLATE = app

QT += qml quick sql core

SOURCES += main.cpp \
    dbprovider.cpp \
    accountitem.cpp \
    accountsmodel.cpp \
    contactitem.cpp \
    contactsmodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    dbprovider.h \
    accountitem.h \
    accountsmodel.h \
    contactitem.h \
    contactsmodel.h
