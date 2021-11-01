import 'package:flutter/material.dart';
import '../../i_slider.dart';

class AndroidSlider implements ISlider {
  @override
  Widget render(double value, ValueSetter<double> onChanged) {
    return Slider(min: 0.0, max: 100.0, value: value, onChanged: onChanged,);
  }

}