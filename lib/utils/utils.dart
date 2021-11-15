import 'dart:io';

import 'package:flutter/material.dart';
import '../entity/design_pattern.dart';
import 'app_colors.dart';

import 'const.dart';

Future navigate(
  String screenName, {
  Object? argument = "",
  bool replace = false,
  bool replaceAll = false,
}) {
  if (globalKey.currentState == null) {
    return Future.value(null);
  }
  if (replace) {
    return globalKey.currentState!
        .pushReplacementNamed(screenName, arguments: argument);
  } else if (replaceAll) {
    return globalKey.currentState!.pushNamedAndRemoveUntil(
      screenName,
      (route) => false,
      arguments: argument,
    );
  } else {
    return globalKey.currentState!.pushNamed(screenName, arguments: argument);
  }
}

bool isAndroid() {
  return Platform.isAndroid;
}

Color switchColor(DesignPattern designPattern) {
  switch (designPattern.id) {
    case abstractFactoryId:
    case builderId:
    case factoryMethodId:
    case prototypeId:
    case singletonId:
      return firstListTileColor;
    case adapterId:
    case bridgeId:
    case compositeId:
    case decoratorId:
    case facadeId:
    case flyweightId:
    case proxyId:
      return secondListTileColor;
    case chainOfResponsibilityId:
    case commandId:
    case iteratorId:
    case mediatorId:
    case mementoId:
    case observerId:
    case stateId:
    case strategyId:
    case templateMethodId:
    case visitorId:
      return thirdListTileColor;
    default:
      throw Exception("Unknown design pattern id: ${designPattern.id}");
  }
}