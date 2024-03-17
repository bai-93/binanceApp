import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sheker/config/theme/themes.dart';

@singleton
class ThemeManager {
  bool _isDark = false;

  ThemeData _themeData = ThemeData.light();

  void changeThemeMode(bool isDark) {
    _themeData = isDark ? darkTheme : lightTheme;
    _isDark = isDark;
  }

  ThemeData getThemeData() {
    return _themeData;
  }

  bool get isDark => _isDark;
}
