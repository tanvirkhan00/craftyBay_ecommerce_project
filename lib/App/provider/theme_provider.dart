import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String _themeKay = "themeMode";

  ThemeMode _currentThemeMode = .dark;

  ThemeMode get currentThemeMode => _currentThemeMode;

  Future<void> loadInitialThemeMode() async {
    ThemeMode mode = await _getThemeMode();
    _currentThemeMode = mode ;

    notifyListeners();
  }

  void changeTheme(ThemeMode mode) {
    if(_currentThemeMode == mode) return;

    _currentThemeMode = mode;
    _saveLocal(mode.name);

    notifyListeners();
  }

  Future<void> _saveLocal(String mode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_themeKay, mode);
  }

  Future<ThemeMode> _getThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String savedThemeMode = sharedPreferences.getString(_themeKay) ?? "";
    return getThemeModeFromString(savedThemeMode);
  }

  ThemeMode getThemeModeFromString(String v) {
    switch(v) {
      case "light" :
        return .light ;
      case "dark":
        return .dark;
      default:
        return .dark;
    }
  }
}