import 'package:flutter/cupertino.dart';

import '../../i_switch.dart';

class IosSwitch implements ISwitch {
  @override
  Widget render(bool value, ValueSetter<bool> onChanged) {
    return CupertinoSwitch(value: value, onChanged: onChanged,);
  }

}