import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../prefs/theme_prefs.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isLight;

  ThemeModel() {
    _isLight = true;
    _setThemeFromPreferences();
  }

  bool get isLight => _isLight;

  void setIsLight(bool value) async {
    _isLight = value;
    isLightModeActive = _isLight;
    ThemePrefs.instance.setTheme(value);
    notifyListeners();
  }

  void _setThemeFromPreferences() async {
    _isLight = await ThemePrefs.instance.getTheme();
    isLightModeActive = _isLight;
    notifyListeners();
  }
}