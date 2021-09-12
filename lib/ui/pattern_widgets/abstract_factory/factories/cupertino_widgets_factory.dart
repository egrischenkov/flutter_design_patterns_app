
import '../i_indicator.dart';
import '../i_platform_widgets_factory.dart';
import '../i_slider.dart';
import '../i_switch.dart';
import '../widgets/cupertino/ios_indicator.dart';
import '../widgets/cupertino/ios_slider.dart';
import '../widgets/cupertino/ios_switch.dart';

class CupertinoWidgetsFactory implements IPlatformWidgetsFactory {
  @override getTitle() {
    return "Cupertino widgets";
  }

  @override
  IIndicator createIndicator() {
    return IosIndicator();
  }

  @override
  ISlider createSlider() {
    return IosSlider();
  }

  @override
  ISwitch createSwitch() {
    return IosSwitch();
  }

}