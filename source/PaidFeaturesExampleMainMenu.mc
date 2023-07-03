import Toybox.WatchUi;
import Toybox.Application;
import PaidFeatures;

class PaidFeaturesExampleMainMenu extends WatchUi.Menu {
    function initialize() {
        Menu.initialize();
        setTitle($.Rez.Strings.AppName);

        addItem($.Rez.Strings.menu_label_1, :item1);
        addItem($.Rez.Strings.menu_label_2, :item2);
        // Check if the feature is unlocked
        if (Application.getApp().featureManager.isUnlocked("Hidden Feature")) {
            addItem($.Rez.Strings.menu_label_3, :item3);
            addItem($.Rez.Strings.menu_remove_label_3, :remove_item3);
        }
        // If you called your Manager instance featureManager, you can use this shortcut
        if (PaidFeatures.isUnlocked("Device bound Feature")) {
            addItem($.Rez.Strings.menu_label_device_feature, :deviceFeature);
        }
        // If you called your Manager instance featureManager, you can use this shortcut
        if (PaidFeatures.isUnlocked("Email bound Feature")) {
            addItem($.Rez.Strings.menu_label_email_feature, :emailFeature);
        }
        addItem($.Rez.Strings.menu_label_4, :item4);
        addItem($.Rez.Strings.menu_label_5, :item5);
    }
}