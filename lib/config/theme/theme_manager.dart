import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sheker/config/theme/themes.dart';
import 'package:sheker/domain/entities/hive_services/user_service_hive.dart';

@singleton
class ThemeManager {
  ThemeData _themeData = ThemeData.light();

  void changeThemeMode(bool isDark) async {
    _themeData = isDark ? darkTheme : lightTheme;
    await UserServiceHive.setThemeFlag(isDark);
  }

  ThemeData getThemeData() {
    return _themeData;
  }

  bool? getIsDark() {
    return UserServiceHive.getIsDarkTheme();
  }
}
