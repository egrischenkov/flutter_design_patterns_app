import 'package:shared_preferences/shared_preferences.dart';

class Prefs {

  String getString(SharedPreferences sharedPrefs, String key, String defaultValue) {
    return sharedPrefs.getString(key) ?? defaultValue;
  }

  Future<bool> setString(SharedPreferences sharedPrefs, String key, String value) {
    return sharedPrefs.setString(key, value);
  }

  int getInt(SharedPreferences sharedPrefs, String key, int defaultValue) {
    return sharedPrefs.getInt(key) ?? defaultValue;
  }

  Future<bool> setInt(SharedPreferences sharedPrefs, String key, int value) {
    return sharedPrefs.setInt(key, value);
  }

  bool getBool(SharedPreferences sharedPrefs, String key, bool defaultValue) {
    return sharedPrefs.getBool(key) ?? defaultValue;
  }

  Future<bool> setBool(SharedPreferences sharedPrefs, String key, bool value) {
    return sharedPrefs.setBool(key, value);
  }
}