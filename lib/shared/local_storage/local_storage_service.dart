import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  static late SharedPreferences _preferences;

  static const String _isDarkModeKey = 'dark_mode';
  static const bool _defaultDarkMode = false;

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internal();

  Future initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool get isDarkMode =>
      _preferences.getBool(_isDarkModeKey) ?? _defaultDarkMode;
  set isDarkMode(bool value) => _preferences.setBool(_isDarkModeKey, value);
}
