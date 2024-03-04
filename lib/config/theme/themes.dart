import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

final lightTheme = ThemeData(
    useMaterial3: true,
    splashFactory: NoSplash.splashFactory,
    colorScheme: ColorScheme.light(background: AppColors.backgroundWhiteTheme),
    primaryColor: Colors.white,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
      color: Colors.black,
    )));

final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(background: AppColors.onboardingPrimary),
    splashFactory: NoSplash.splashFactory,
    primaryColor: Colors.black,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
      color: Colors.white,
    )));
