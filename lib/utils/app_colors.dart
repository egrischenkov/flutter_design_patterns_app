import 'dart:ui';

import 'package:flutter/material.dart';

bool isLightModeActive = true;

const mainPageBackgroundColorLight = Color(0xFF8E93B3);

const favoritePageBackgroundColorLight = Color(0xFF8E93B3);

const firstListTileColorLight = Color(0xFFD96F9F);
const secondListTileColorLight = Color(0xFF8541B0);
const thirdListTileColorLight = Color(0xFF150428);

const appBarColorLight = Colors.white;

const appBarItemColorLight = Colors.black;

const listTileShadowColor = Color(0xFF5C6B75);

const listTileBackgroundLightColor = Colors.white;

const listTileTextLightColor = Colors.black;

const appBarTextLightColor = Colors.white;

const tabLabelSelectedLightColor = Colors.white;
const tabLabelUnselectedLightColor = Colors.black;

final tabGradientColorLight = [
  mainPageBackgroundColorLight.withOpacity(0.9),
  mainPageBackgroundColorLight,
];


ThemeData dayTheme(BuildContext context) => ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: Theme.of(context)
      .appBarTheme
      .copyWith(brightness: Brightness.light),
);

ThemeData nightTheme(BuildContext context) => ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: Theme.of(context)
      .appBarTheme
      .copyWith(brightness: Brightness.light),
);
// final dayTheme = ThemeData(
//   colorScheme: ColorScheme.light(
//     primary: accentColorLight,
//     secondary: appBarColorLight,
//   ),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: buttonLightColor,
//     foregroundColor: Colors.white,
//     splashColor: buttonSplashColor,
//   ),
//   brightness: Brightness.light,
//   scaffoldBackgroundColor: backgroundColor,
//   canvasColor: backgroundLightColor,
//   appBarTheme: AppBarTheme(
//     color: backgroundLightColor,
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
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: buttonDarkColor,
//     foregroundColor: Colors.white,
//     splashColor: buttonSplashColor,
//   ),
//   brightness: Brightness.dark,
//   canvasColor: backgroundDarkColor,
//   scaffoldBackgroundColor: backgroundDarkColor,
//   appBarTheme: AppBarTheme(
//     color: backgroundDarkColor,
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