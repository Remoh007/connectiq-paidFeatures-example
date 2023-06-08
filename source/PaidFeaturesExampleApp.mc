import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import PaidFeatures;

class PaidFeaturesExampleApp extends Application.AppBase {
    public var featureManager = new PaidFeatures.Manager();

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        var codeForNewFeature = new PaidFeatures.Code("ITEM3", PaidFeatures.CODE_TYPE.GLOBAL);
        var newFeature = new PaidFeatures.Feature("Hidden Feature", codeForNewFeature);
        featureManager.addFeature(newFeature);
        featureManager.unlockFeatures();
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // onSettingsChanged() is called when the application settings have been changed by Garmin Connect Mobile (GCM) while while the app is running
    function onSettingsChanged() as Void {
        featureManager.unlockFeatures();
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new PaidFeaturesExampleMainMenu(), new PaidFeaturesExampleMenuDelegate() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as PaidFeaturesExampleApp {
    return Application.getApp() as PaidFeaturesExampleApp;
}