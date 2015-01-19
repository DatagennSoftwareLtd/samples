TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

DISTFILES += \
    main.qml \
    NavigationDrawer.qml \
    CollapsiblePanel.qml \
    MenuItems.qml \
    BurnerTelMenu.qml


RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
