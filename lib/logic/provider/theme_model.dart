import 'package:flutter/material.dart';
import '../prefs/theme_prefs.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isLight;

  ThemeModel() {
    _isLight = false;
    _setThemeFromPreferences();
  }

  bool get isLight => _isLight;

  void setIsLight(bool value) async {
    _isLight = value;
    ThemePrefs.instance.setTheme(value);
    notifyListeners();
  }

  void _setThemeFromPreferences() async {
    _isLight = await ThemePrefs.instance.getTheme();
    notifyListeners();
  }
}