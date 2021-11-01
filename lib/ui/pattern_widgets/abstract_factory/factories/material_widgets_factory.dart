import '../i_indicator.dart';
import '../i_platform_widgets_factory.dart';
import '../i_slider.dart';
import '../i_switch.dart';
import '../widgets/android/andorid_switch.dart';
import '../widgets/android/android_indicator.dart';
import '../widgets/android/android_slider.dart';

class MaterialWidgetsFactory implements IPlatformWidgetsFactory {
  @override
  String getTitle() {
    return "Android widgets";
  }

  @override
  IIndicator createIndicator() {
    return AndroidIndicator();
  }

  @override
  ISlider createSlider() {
    return AndroidSlider();
  }

  @override
  ISwitch createSwitch() {
    return AndroidSwitch();
  }

}