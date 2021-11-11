import 'dart:ui';

import 'package:flutter/material.dart';

bool isLightModeActive = true;

const mainBackgroundColorLight = Colors.white;
const mainBackgroundColorDark = Color(0xFF8E93B3);

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

const appBarColorLight = Colors.white;

const appBarItemColorLight = Colors.black;

const listTileShadowColor = Color(0xFF5C6B75);

const listTileBackgroundLightColor = Colors.white;

const listTileTextLightColor = Colors.black;

const appBarTextLightColor = Colors.white;

const tabLabelSelectedLightColor = Colors.white;
const tabLabelUnselectedLightColor = Colors.black;

const textColorLight = Colors.black87;
const textColorDark = Colors.white;

final tabGradientColorLight = [
  mainBackgroundColorDark.withOpacity(0.9),
  mainBackgroundColorDark,
];

final tabGradientColorDark = [
  mainBackgroundColorLight.withOpacity(0.9),
  mainBackgroundColorLight,
];

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

List<Color> get tabGradientColor {
  return isLightModeActive ? tabGradientColorLight : tabGradientColorDark;
}

ThemeData dayTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme:
          Theme.of(context).appBarTheme.copyWith(brightness: Brightness.light),
    );

ThemeData nightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme:
          Theme.of(context).appBarTheme.copyWith(brightness: Brightness.light),
    );
// final dayTheme = ThemeData(
//   colorScheme: ColorScheme.light(
//     primary: accentColorLight,
//     secondary: appBarColorLight,
//   ),
//   brightness: Brightness.light,
//   scaffoldBackgroundColor: backgroundColor,
//   canvasColor: backgroundLightColor,
//   appBarTheme: AppBarTheme(
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarBrightness: Brightness.light,
//       systemNavigationBarIconBrightness: Brightness.light,
//     ),
//   ),
//   backgroundColor: backgroundLightColor,
//   primaryColor: accentColorLight,
//   splashColor: backgroundLightColor,
//   cupertinoOverrideTheme: CupertinoThemeData(
//     brightness: Brightness.light,
//   ),
//   primaryColorBrightness: Brightness.light,
// );

// final nightTheme = ThemeData(
//   fontFamily: appFontFamily,
//   colorScheme: ColorScheme.dark(
//     primary: accentColorDark,
//     secondary: appBarColorDark,
//   ),
//   brightness: Brightness.dark,
//   canvasColor: backgroundDarkColor,
//   scaffoldBackgroundColor: backgroundDarkColor,
//   appBarTheme: AppBarTheme(
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarBrightness: Brightness.dark,
//       systemNavigationBarIconBrightness: Brightness.dark,
//     ),
//   ),
//   backgroundColor: backgroundDarkColor,
//   primaryColor: accentColorDark,
//   splashColor: backgroundDarkColor,
//   primaryColorBrightness: Brightness.dark,
// );
