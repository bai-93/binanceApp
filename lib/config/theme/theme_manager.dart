import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  void changeThemeMode(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    return _themeMode;
  }
}
