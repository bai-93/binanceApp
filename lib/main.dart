import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:sheker/base_widgets/tabBar_widget/bottom_menu_indicator/tab_bar_indicator.dart';
import 'package:sheker/loginFlow/loginScreen/loginScreen.dart';
import 'package:sheker/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        debugShowFloatingThemeButton: true,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkThemes) {
          return MaterialApp(
              theme: theme,
              darkTheme: darkThemes,
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              debugShowMaterialGrid: false,
              home: const BottomMenuTabBar());
        });
  }
}
