import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final SharedPreferences prefs;
  PreferencesHelper(this.prefs);

  Future<bool> getBool(String key) async {
    return prefs.getBool(key) ?? false;
  }

  Future setBool(String key, bool value) async {
    return prefs.setBool(key, value);
  }

  Future<int> getInt(String key) async {
    return prefs.getInt(key) ?? 0;
  }

  Future setInt(String key, int value) async {
    return prefs.setInt(key, value);
  }

  Future<String> getString(String key) async {
    return prefs.getString(key) ?? '';
  }

  Future<String> getStringLanguage(String key) async {
    return prefs.getString(key) ?? 'ar';
  }

  Future setString(String key, String value) async {
    return prefs.setString(key, value);
  }

  Future<List<String>> getStringList(String key) async {
    return prefs.getStringList(key) ?? [];
  }

  Future setStringList(String key, List<String> value) async {
    return prefs.setStringList(key, value);
  }

  Future<double> getDouble(String key) async {
    return prefs.getDouble(key) ?? 0.0;
  }

  Future setDouble(String key, double value) async {
    return prefs.setDouble(key, value);
  }

  // helper

  // static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
