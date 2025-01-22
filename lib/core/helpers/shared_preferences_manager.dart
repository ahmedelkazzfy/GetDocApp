import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  // Singleton instance
  static final SharedPreferencesManager _instance =
      SharedPreferencesManager._internal();
  factory SharedPreferencesManager() => _instance;

  SharedPreferencesManager._internal();

  // Private instance of SharedPreferences
  late SharedPreferences _preferences;

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Initialize SharedPreferences (can be called in main or at app start)
  Future<void> init() async {
    await _init();
  }

  // Save a map as JSON string
  Future<void> saveMap(String key, Map<String, dynamic> map) async {
    String jsonString = jsonEncode(map);
    await _preferences.setString(key, jsonString);
  }

  // Load a map from SharedPreferences
  Future<Map<String, dynamic>> loadMap(String key) async {
    String? jsonString = _preferences.getString(key);
    if (jsonString != null) {
      return Map<String, dynamic>.from(jsonDecode(jsonString));
    }
    return {}; // Return an empty map if no value is found
  }

  // Save any other data types (e.g., int, string, double, etc.)
  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  Future<String?> loadString(String key) async {
    return _preferences.getString(key);
  }

  Future<void> saveInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  Future<int?> loadInt(String key) async {
    return _preferences.getInt(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  Future<bool?> loadBool(String key) async {
    return _preferences.getBool(key);
  }

  // Additional methods for other types (double, etc.) can be added similarly
}
