import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/config/theme/theme_manager.dart';
import 'package:sheker/config/theme/themes.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/presentation/bloc/providers.dart';
import 'package:sheker/config/route/main_router.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await configureDependencies(
      environment:
          prod); // we can switch just passing a values like 'prod' and 'dev'
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeManager _themeManager = getIt<ThemeManager>();

  @override
  void initState() {
    _themeManager.addListener(() {
      debugPrint("listener of THEMEMANAGER");
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _themeManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: Providers.getProviders,
        child: MaterialApp.router(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: _themeManager.getThemeMode(),
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            routerConfig: AppRouter().router));
  }
}
