import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

WidgetStateColor convertColor(Color color) {
  return WidgetStateColor.resolveWith((states) => color);
}

final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    splashColor: Colors.transparent,
    primaryColor: AppColorsUtility.lightBackground,
    hintColor: AppColorsUtility.darkBackground.withAlpha(80),
    scaffoldBackgroundColor: AppColorsUtility.lightBackground,
    appBarTheme: AppBarTheme(backgroundColor: AppColorsUtility.lightBackground),
    colorScheme:
        ColorScheme.light(surface: AppColorsUtility.surface), // container
    tabBarTheme: TabBarTheme(
        splashFactory: NoSplash.splashFactory,
        overlayColor: convertColor(Colors.transparent)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                side: BorderSide(
                    color: AppColorsUtility.onboardingPrimary, width: 2.0)),
            splashFactory: NoSplash.splashFactory,
            foregroundColor: Colors.grey.shade500,
            surfaceTintColor: AppColorsUtility.lightBackground)),
    //TEXT
    textTheme: TextTheme(
        titleSmall: TextStyle(
            color: AppColorsUtility.secondary,
            fontSize: 12.0,
            fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            color: AppColorsUtility.text,
            fontSize: 12.0,
            fontWeight: FontWeight.w400),
        labelMedium: TextStyle(
            color: AppColorsUtility.text,
            fontSize: 16.0,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: AppColorsUtility.text,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            color: AppColorsUtility.onboardingPrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            color: AppColorsUtility.text,
            fontSize: 18.0,
            fontWeight: FontWeight.w500)));

final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    splashColor: Colors.transparent,
    primaryColor: AppColorsUtility.darkBackground, // background
    hintColor: Color.fromARGB(255, 126, 144, 147),
    scaffoldBackgroundColor: AppColorsUtility.darkBackground,
    appBarTheme: AppBarTheme(backgroundColor: AppColorsUtility.darkBackground),
    tabBarTheme: TabBarTheme(
        splashFactory: NoSplash.splashFactory,
        overlayColor: convertColor(Colors.transparent)),
    colorScheme:
        ColorScheme.dark(surface: AppColorsUtility.darkSurface), // containers
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          side: BorderSide(
              color: AppColorsUtility.onboardingPrimary, width: 2.0)),
      splashFactory: NoSplash.splashFactory,
      backgroundColor: AppColorsUtility.darkSurface,
      foregroundColor: AppColorsUtility.text,
    )),

    // TEXT
    textTheme: TextTheme(
        titleSmall: TextStyle(
            color: AppColorsUtility.secondary,
            fontSize: 12.0,
            fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            color: AppColorsUtility.surface,
            fontSize: 12.0,
            fontWeight: FontWeight.w400),
        labelMedium: TextStyle(
            // label is color of text inside
            color: AppColorsUtility.surface,
            fontSize: 16.0,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: AppColorsUtility.surface,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(
            color: AppColorsUtility.surface,
            fontSize: 16.0,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            color: AppColorsUtility.surface,
            fontSize: 18.0,
            fontWeight: FontWeight.w500)));
