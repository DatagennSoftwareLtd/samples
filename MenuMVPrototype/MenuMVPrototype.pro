TEMPLATE = app

QT += qml quick

SOURCES += main.cpp \
    mainmenumodel.cpp \
    menuitem.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    mainmenumodel.h \
    menuitem.h

DISTFILES += \
    CheckerDelegate.qml \
    EditDelegate.qml \
    ButtonDelegate.qml \
    ButtonCustom.qml \
    CollapsiblePanel.qml \
    NavigationDrawer.qml

