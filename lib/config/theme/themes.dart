import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    splashFactory: NoSplash.splashFactory,
    primaryColor: Colors.white,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
      color: Colors.black,
    )));

final darkTheme = ThemeData(
    primaryColor: Colors.black,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
      color: Colors.white,
    )));
