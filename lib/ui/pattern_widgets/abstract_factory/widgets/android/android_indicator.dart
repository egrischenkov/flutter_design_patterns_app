import 'package:flutter/material.dart';
import '../../i_indicator.dart';

class AndroidIndicator implements IIndicator {
  @override
  Widget render() {
    return CircularProgressIndicator();
  }

}
