TEMPLATE = app

QT += qml quick widgets multimedia

SOURCES += main.cpp

RESOURCES += qml.qrc

OTHER_FILES += \
    content/main.qml \
    content/SliderMenu.qml \
    content/NavigationDrawer.qml \
    content/WhisperrToolBar.qml \
    content/WhisperrFooterBar.qml \
    content/init.qml \
    content/ssload.qml \
    content/WhisperrSS.qml \
    content/WelcomeScreen/forgotpass.qml \
    content/WelcomeScreen/login.qml \
    content/WelcomeScreen/signup.qml \
    content/WelcomeScreen/SwipeScreen.qml \
    content/WelcomeScreen/SwipeView.qml

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
    android/res/values/style.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
