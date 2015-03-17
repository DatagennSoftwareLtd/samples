TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

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
    android/src/org/qtproject/example/sampleService.java \
    android/src/org/qtproject/example/sampleServiceActivity.java \
    android/src/org/qtproject/example/sampleServiceBroadcastReceiver.java \
    android/res/layout/serviceconfigactivity.xml \
    android/src/org/qtproject/qt5/android/addons/qtserviceapp/QtService.java \
    android/src/org/qtproject/qt5/android/addons/qtserviceapp/QtServiceActivity.java \
    android/src/org/qtproject/qt5/android/addons/qtserviceapp/QtServiceBroadcastReceiver.java \
    android/src/org/qtproject/qt5/android/QtServiceDelegate.java

