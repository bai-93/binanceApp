import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/config/theme/themes.dart';
import 'package:sheker/network_layer/dio_client/dio_client.dart';
import 'package:sheker/network_layer/retofit_layer/rest_client.dart';
import 'presentation/pages/home_tabBar_page/main_part/main_menu_tabBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(
      environment:
          prod); // we can switch just setting keywords like 'prod' and 'dev'
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
