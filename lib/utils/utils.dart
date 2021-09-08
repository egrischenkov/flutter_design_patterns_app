import 'dart:io';

import 'const.dart';

bool isAndroid() {
  return Platform.isAndroid;
}

Future navigate(String screenName, {Object? argument = "", bool replace = false, bool replaceAll = false}) {
  if (globalKey.currentState == null) {
    return Future.value(null);
  }
  if (replace) {
    return globalKey.currentState!.pushReplacementNamed(screenName, arguments: argument);
  } else if (replaceAll) {
    return globalKey.currentState!.pushNamedAndRemoveUntil(screenName, (route) => false, arguments: argument);
  } else {
    return globalKey.currentState!.pushNamed(screenName, arguments: argument);
  }
}