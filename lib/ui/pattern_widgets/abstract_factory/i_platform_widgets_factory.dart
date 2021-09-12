import 'i_indicator.dart';
import 'i_slider.dart';
import 'i_switch.dart';

abstract class IPlatformWidgetsFactory {
  String getTitle();
  IIndicator createIndicator();
  ISlider createSlider();
  ISwitch createSwitch();
}