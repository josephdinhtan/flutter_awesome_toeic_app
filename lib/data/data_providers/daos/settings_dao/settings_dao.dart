// ignore_for_file: unused_element

import 'package:shared_preferences/shared_preferences.dart';

const _logTag = "SettingsDAO";

class SettingsDao {
  Future<bool> insert(dynamic value, String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      return await prefs.setInt(key, value);
    } else if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is bool) {
      return await prefs.setBool(key, value);
    }
    return false;
  }

  Future<dynamic> query(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  Future<bool> update(dynamic value, String key) {
    return insert(value, key);
  }
}
