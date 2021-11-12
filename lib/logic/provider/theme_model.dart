import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/app_colors.dart';
import '../prefs/theme_prefs.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isLight;
  SystemUiOverlayStyle? _systemUiOverlayStyle;

  ThemeModel() {
    _isLight = true;
    _setThemeFromPreferences().then((_) {
      _initSystemUiOverlayStyle();
    });
  }

  bool get isLight => _isLight;

  void setIsLight(bool value) async {
    _isLight = value;
    isLightModeActive = _isLight;
    ThemePrefs.instance.setTheme(value);
    _setSystemUiOverlayStyle();
    notifyListeners();
  }

  Future<void> _setThemeFromPreferences() async {
    _isLight = await ThemePrefs.instance.getTheme();
    isLightModeActive = _isLight;
    notifyListeners();
  }

  void _setSystemUiOverlayStyle() {
    _systemUiOverlayStyle =
    isLightModeActive ? lightSystemTheme : darkSystemTheme;
    SystemChrome.setSystemUIOverlayStyle(_systemUiOverlayStyle!);
  }

  void _initSystemUiOverlayStyle() {
    _setSystemUiOverlayStyle();
    notifyListeners();
  }
}