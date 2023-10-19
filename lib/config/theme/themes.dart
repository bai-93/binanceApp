import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    primaryColor: Colors.white,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            decoration: TextDecoration.underline,
            decorationThickness: 0.5,
            decorationColor: Colors.black)));

final darkTheme = ThemeData(
    primaryColor: Colors.black,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            decoration: TextDecoration.underline,
            decorationThickness: 0.5,
            decorationColor: Colors.white)));
