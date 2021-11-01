import 'package:flutter/cupertino.dart';

import '../../i_slider.dart';

class IosSlider implements ISlider {
  @override
  Widget render(double value, ValueSetter<double> onChanged) {
    return CupertinoSlider(min: 0.0, max: 100.0, value: value, onChanged: onChanged);
  }

}