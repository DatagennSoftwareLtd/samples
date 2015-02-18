import QtQuick 2.0

Item {
    id: init

    SplashScreen {
        id: splash
        show: true              // show splash
        minTimeout: 3000         // show splash at least for 3 sec
        image: "images/splashscreen.png"  // path to splash image
        canFinish: false         // change to true when main QML will be loaded
        z: 100                   // highest page.
    }

    Loader { // this component performs deferred loading.
        id: mainLoader
        onStatusChanged: {
            if( mainLoader.status == Loader.Ready )
            {
                // main page is loaded
                // time to hide splash
                splash.canFinish = true
            }
        }
    }

    Component.onCompleted:  {
        // splash is already rendered on the screen
        // user is looking on splash
        // now we can start loader to load main page
        mainLoader.source = "main.qml"
    }
}
