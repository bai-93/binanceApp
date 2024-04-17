import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sheker/config/theme/themes.dart';
import 'package:sheker/domain/entities/hive_services/hive_service.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/presentation/bloc/providers.dart';
import 'package:sheker/config/route/main_router.dart';
import 'config/theme/bloc/theme_bloc.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await configureDependencies(
      environment:
          prod); // we can switch just passing a values like 'prod' and 'dev'
  await Hive.initFlutter();
  await getIt<MainHiveService>().registerAdapters();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: Providers.getProviders,
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is ThemeLightState) {
              return main(state.mode);
            }
            if (state is ThemeDarkState) {
              return main(state.mode);
            }
            return const Center();
          },
        ));
  }

  Widget main(ThemeMode mode) {
    return MaterialApp.router(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: mode,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        routerConfig: AppRouter().router);
  }
}
