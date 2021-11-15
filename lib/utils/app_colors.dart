import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool isLightModeActive = true;

const mainBackgroundColorLight = Colors.white;
const mainBackgroundColorDark = Color(0xFF8E93B3);

const favoriteScreenBackgroundColorLight = Color(0xFFF78888);
const favoriteScreenBackgroundColorDark = Color(0xFF150428);

const listItemBackgroundColorLight = Colors.white;
const listItemBackgroundColorDark = Color(0xFF8E93B3);

const firstListTileColorLight = Color(0xFFF3D250);
const firstListTileColorDark = Color(0xFFD96F9F);

const secondListTileColorLight = Color(0xFF90CCF4);
const secondListTileColorDark = Color(0xFF8541B0);

const thirdListTileColorLight = Color(0xFFF78888);
const thirdListTileColorDark = Color(0xFF150428);

const heartIconColorLight = Color(0xFFF78888);
const heartIconColorDark = Color(0xFFD96F9F);

const heartIconListTileColorLight = Color(0xFFF78888);
const heartIconListTileColorDark = Colors.white;

const listTileShadowColor = Color(0xFF5C6B75);

const tabLabelSelectedLightColor = Colors.white;
const tabLabelSelectedDarkColor = Colors.black;

const tabLabelUnselectedLightColor = Colors.black;
const tabLabelUnselectedDarkColor = Colors.white;

const textColorLight = Colors.black87;
const textColorDark = Colors.white;

const buttonBackgroundColor = Color(0xFF8E93B3);

final stockUpColorLight = Colors.green[900];
const stockUpColorDark = Colors.green;

final stockDownColorLight = Colors.red[900];
const stockDownColorDark = Colors.red;


final tabGradientColorLight = [
  mainBackgroundColorDark.withOpacity(0.9),
  mainBackgroundColorDark,
];

final tabGradientColorDark = [
  mainBackgroundColorLight.withOpacity(0.9),
  mainBackgroundColorLight,
];

final lightSystemTheme = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
);
final darkSystemTheme = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);

Color get mainBackgroundColor {
  return isLightModeActive ? mainBackgroundColorLight : mainBackgroundColorDark;
}

Color get firstListTileColor {
  return isLightModeActive ? firstListTileColorLight : firstListTileColorDark;
}

Color get secondListTileColor {
  return isLightModeActive ? secondListTileColorLight : secondListTileColorDark;
}

Color get thirdListTileColor {
  return isLightModeActive ? thirdListTileColorLight : thirdListTileColorDark;
}

Color get heartIconColor {
  return isLightModeActive ? heartIconColorLight : heartIconColorDark;
}

Color get textColor {
  return isLightModeActive ? textColorLight : textColorDark;
}

Color get heartIconListTileColor {
  return isLightModeActive
      ? heartIconListTileColorLight
      : heartIconListTileColorDark;
}

Color get listItemBackgroundColor {
  return isLightModeActive
      ? listItemBackgroundColorLight
      : listItemBackgroundColorDark;
}

Color get tabLabelSelectedColor {
  return isLightModeActive
      ? tabLabelSelectedLightColor
      : tabLabelSelectedDarkColor;
}

Color get tabLabelUnselectedColor {
  return isLightModeActive
      ? tabLabelUnselectedLightColor
      : tabLabelUnselectedDarkColor;
}

Color get favoriteScreenBackgroundColor {
  return isLightModeActive
      ? favoriteScreenBackgroundColorLight
      : favoriteScreenBackgroundColorDark;
}

Color get stockUpColor {
  return isLightModeActive
      ? stockUpColorLight ?? Colors.green
      : stockUpColorDark;
}

Color get stockDownColor {
  return isLightModeActive
      ? stockDownColorLight ?? Colors.red
      : stockDownColorDark;
}

List<Color> get tabGradientColor {
  return isLightModeActive ? tabGradientColorLight : tabGradientColorDark;
}

ThemeData dayTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: mainBackgroundColorLight,
    ),
    textTheme: Theme.of(context).textTheme.apply(
          displayColor: Colors.black,
          bodyColor: Colors.black,
        ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(buttonBackgroundColor),
        elevation: MaterialStateProperty.all<double>(5),
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: mainBackgroundColorLight,
    canvasColor: mainBackgroundColorLight,
    backgroundColor: mainBackgroundColorLight,
    splashColor: mainBackgroundColorLight,
  );
}

ThemeData nightTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.dark(
      primary: mainBackgroundColorDark,
    ),
    brightness: Brightness.dark,
    canvasColor: mainBackgroundColorDark,
    scaffoldBackgroundColor: mainBackgroundColorDark,
    textTheme: Theme.of(context)
        .textTheme
        .apply(displayColor: Colors.white, bodyColor: Colors.white),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        backgroundColor:
            MaterialStateProperty.all<Color>(buttonBackgroundColor),
        elevation: MaterialStateProperty.all<double>(5),
      ),
    ),
    backgroundColor: mainBackgroundColorDark,
    splashColor: mainBackgroundColorDark,
  );
}
