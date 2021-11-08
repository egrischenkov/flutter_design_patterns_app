import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  late SharedPreferences sharedPrefs;

  Future<void> initPrefs() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  String getString(String key, String defaultValue) {
    return sharedPrefs.getString(key) ?? defaultValue;
  }

  Future<bool> setString(String key, String value) {
    return sharedPrefs.setString(key, value);
  }

  int getInt(String key, int defaultValue) {
    return sharedPrefs.getInt(key) ?? defaultValue;
  }

  Future<bool> setInt(String key, int value) {
    return sharedPrefs.setInt(key, value);
  }

  bool getBool(String key, bool defaultValue) {
    return sharedPrefs.getBool(key) ?? defaultValue;
  }

  Future<bool> setBool(String key, bool value) {
    return sharedPrefs.setBool(key, value);
  }
}