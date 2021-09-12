import 'package:flutter/cupertino.dart';
import '../../i_indicator.dart';

class IosIndicator implements IIndicator {
  @override
  Widget render() {
    return CupertinoActivityIndicator();
  }
}
