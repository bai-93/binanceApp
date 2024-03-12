import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/home_page/settings/settings.dart';

abstract class SettingsDelegateActionsHandle {
  void selectedRows(String data, int indexSection, int index);
  void selectedTheme(bool isDark);
}
