import Toybox.Lang;
import Toybox.WatchUi;

class PaidFeaturesExampleDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new PaidFeaturesExampleMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}