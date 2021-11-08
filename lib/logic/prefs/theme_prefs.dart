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

  Future<bool> setTheme(bool value) {
    return setBool(themeKey, value);
  }

  bool getTheme() {
    return getBool(themeKey, false);
  }
}