
import 'package:flutter/material.dart';

abstract class ISwitch {
  Widget render(bool value, ValueSetter<bool> onChanged);
}