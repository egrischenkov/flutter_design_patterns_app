import 'package:shared_preferences/shared_preferences.dart';

import 'prefs.dart';

class ThemePrefs extends Prefs {
  static const themeKey = 'theme_key';

  static ThemePrefs? _themePrefs;

  ThemePrefs._();

  static ThemePrefs get instance {
    if (_themePrefs == null) {
      _themePrefs = ThemePrefs._();
    }

    return _themePrefs!;
  }

  Future<bool> setTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    return setBool(prefs, themeKey, value);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();

    return getBool(prefs, themeKey, true);
  }
}