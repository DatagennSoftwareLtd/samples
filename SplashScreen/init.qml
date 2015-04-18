import QtQuick 2.0

Item {
    id: mainAppLoaderItem

    // Loaders for the main application and the splash screen.
    Loader {
        id: mainAppLoader
        width: mainAppLoaderItem.width
        height: mainAppLoaderItem.height
        onLoaded: console.debug("Main application loaded.");
    }

    Loader {
        id: splashScreenLoader
        source: "qrc:/SplashScreen2.qml";
        width: mainAppLoaderItem.width
        height: mainAppLoaderItem.height
        onLoaded: {
            item.progressBarValue = 50;
            console.debug("SplashScreen loaded.");
        }

    }

    // Timers for starting to load the main application and eventually deleting
    // the splash screen.
    Timer {
        id: firstPhaseTimer
        property int phase: 0
        interval: 700
        running: true
        repeat: false
        onTriggered: {
            if (!mainAppLoader.Loading) {
                console.debug("Starting to load the main application.");
                mainAppLoader.source = "qrc:/main.qml";
                secondPhaseTimer.start();
            }
        }
    }

    Timer {
        id: secondPhaseTimer
        property int phase: 0
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            if (phase == 0) {
                if (mainAppLoader.Loading) {
                    console.debug("The main application is not loaded yet.");
                    return;
                }
                console.debug("Finishing the splash screen progress bar.");
                if (splashScreenLoader.item) {
                    splashScreenLoader.item.progressBarValue = 100;
                }
                // Set the phase for deletion.
                phase += 1;
            }
            else if (phase == 1) {
                // Hide the splash screen.
                console.debug("Hiding the splash screen.");
                if (splashScreenLoader.item) {
                    splashScreenLoader.item.opacity = 0;
                }
                phase += 1;
            }
            else {
                // Delete the splash screen.
                console.debug("Deleting the splash screen.");
                // By setting the source property to an empty string destroys
                // the loaded item.
                splashScreenLoader.source = "";
                secondPhaseTimer.stop();
            }
        }
    }
}

/*
Item {
    id: init

    SplashScreen2 {
        id: splash
        show: true              // show splash
        minTimeout: 3000         // show splash at least for 3 sec
        image: "qrc:/splashscreen2.png"  // path to splash image
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
*/
