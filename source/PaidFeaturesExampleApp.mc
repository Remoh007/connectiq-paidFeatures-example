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

        var codeForDeviceFeature = new PaidFeatures.Code("DEVICE", PaidFeatures.CODE_TYPE.DEVICE);
        var deviceFeature = new PaidFeatures.Feature("Device bound Feature", codeForDeviceFeature);
        featureManager.addFeature(deviceFeature);
        // This shows you the code to unlock the device feature
        System.println("DEVICE BOUND FEATURE INFO");
        System.println("DeviceID: " + PaidFeatures.uniqueDeviceIdentifier());
        System.println("Unlock Code: " + codeForDeviceFeature.generateDeviceCode({}));
        
        var codeForEmailFeature = new PaidFeatures.Code("EMAIL", PaidFeatures.CODE_TYPE.EMAIL);
        var emailFeature = new PaidFeatures.Feature("Email bound Feature", codeForEmailFeature);
        featureManager.addFeature(emailFeature);
        
        // This shows you the code to unlock the email feature
        var email = PaidFeatures.getEmail();
        System.println("EMAIL BOUND FEATURE INFO");
        if (email.equals("")) {
            System.println("Current Email: No Email set!");
            System.println("Unlock Code: No Code available!");
        } else {
            System.println("Current Email: " + email );
            System.println("Unlock Code: " + codeForEmailFeature.generateEmailCode({}));
        }
        
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
        var version = System.getDeviceSettings().monkeyVersion;
        if (version[0] < 3 || ( version[0] == 3 && version[1] < 1)) {
            // Push a non native view in between to prevent app crashes
            return [new $.InitialView()] as Array<Views or InputDelegates>;
        }

        return [ new $.PaidFeaturesExampleMainMenu(), new $.PaidFeaturesExampleMenuDelegate() ] as Array<Views or InputDelegates>;
    }

}

//! This InitialView is used to show a native View as first View
//! and prevent any app crash for SDK <3.0.x
class InitialView extends WatchUi.View {
    public function initialize() {
        WatchUi.View.initialize();
    }

    public function onShow() {
        WatchUi.pushView(new $.PaidFeaturesExampleMainMenu(), new $.PaidFeaturesExampleMenuDelegate(), WatchUi.SLIDE_IMMEDIATE);
    }
}

function getApp() as PaidFeaturesExampleApp {
    return Application.getApp() as PaidFeaturesExampleApp;
}