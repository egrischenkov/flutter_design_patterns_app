import 'package:flutter/material.dart';

import '../../i_switch.dart';

class AndroidSwitch implements ISwitch {
  @override
  Widget render(bool value, ValueSetter<bool> onChanged) {
    return Switch(value: value, onChanged: onChanged,);
  }
}