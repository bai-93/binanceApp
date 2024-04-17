import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

MaterialStateColor convertColor(Color color) {
  return MaterialStateColor.resolveWith((states) => color);
}

final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    primaryColor: AppColors.surface,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.lightBackground),
    colorScheme: ColorScheme.light(background: AppColors.surface),
    tabBarTheme: TabBarTheme(
        splashFactory: NoSplash.splashFactory,
        overlayColor: convertColor(Colors.transparent)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                side:
                    BorderSide(color: AppColors.onboardingPrimary, width: 2.0)),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: Colors.grey.shade500,
            surfaceTintColor: AppColors.lightBackground)),
    textTheme: TextTheme(
        labelMedium: TextStyle(
            color: AppColors.text, fontSize: 16.0, fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: AppColors.text, fontSize: 14.0, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            color: AppColors.onboardingPrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            color: AppColors.text,
            fontSize: 18.0,
            fontWeight: FontWeight.w500)));

final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    primaryColor: AppColors.darkBackground, // background
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.darkBackground),
    tabBarTheme: TabBarTheme(
        splashFactory: NoSplash.splashFactory,
        overlayColor: convertColor(Colors.transparent)),
    colorScheme:
        ColorScheme.dark(background: AppColors.darkSurface), // containers
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          side: BorderSide(color: AppColors.onboardingPrimary, width: 2.0)),
      splashFactory: NoSplash.splashFactory,
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.text,
    )),
    textTheme: TextTheme(
        labelMedium: TextStyle(
            color: AppColors.surface,
            fontSize: 16.0,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: AppColors.surface,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            color: AppColors.surface,
            fontSize: 16.0,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            color: AppColors.surface,
            fontSize: 18.0,
            fontWeight: FontWeight.w500)));
