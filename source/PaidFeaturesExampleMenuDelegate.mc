import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class PaidFeaturesExampleMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :item1) {
            System.println("item 1");
        } else if (item == :item2) {
            System.println("item 2");
        } else if (item == :item3) {
            System.println("This is the hidden item");
            System.println("Run specific feature code here!");
        } else if (item == :item4) {
            if (WatchUi has :Menu2) {
                System.println("Show a modern Menu2");
                WatchUi.pushView(new @PaidFeatures.InfoView(), new @PaidFeatures.InfoViewDelegate(), WatchUi.SLIDE_LEFT);
            } else {
                System.println("Show a basic Menu");
                WatchUi.pushView(new @PaidFeatures.Rez.Menus.BasicInfoMenu(), new PaidFeatures.BasicInfoMenuDelegate(), WatchUi.SLIDE_LEFT);
            }
        } else if (item == :item5) {
            System.println("Deleting all codes and lock all features");
            var featureManager = Application.getApp().featureManager;
            featureManager.cleanAllCodes();
        } else if (item == :emailFeature) {
            System.println("This feature is bound to a specific email");
        } else if (item == :deviceFeature) {
            System.println("This feature is bound to a specific device");
        } else if (item == :remove_item3) {
            System.println("Removing the hidden item");
            var featureManager = Application.getApp().featureManager;
            var result = featureManager.lockFeature("Hidden Feature");
            System.println("feature was successfully locked: " + result);
        } 
    }

}