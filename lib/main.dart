import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/config/theme/themes.dart';
import 'package:sheker/presentation/bloc/providers.dart';
import 'presentation/pages/home_tabBar_page/main_part/main_menu_tabBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(
      environment:
          prod); // we can switch just passing a values like 'prod' and 'dev'
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Providers.getProviders,
      child: AdaptiveTheme(
          light: lightTheme,
          dark: darkTheme,
          debugShowFloatingThemeButton: false,
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkThemes) {
            return MaterialApp(
                theme: theme,
                darkTheme: darkThemes,
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                debugShowMaterialGrid: false,
                home: const BottomMenuTabBar());
          }),
    );
  }
}
