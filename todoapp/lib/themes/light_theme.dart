import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.white),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Color.fromARGB(255, 61, 61, 61),
    secondary: Color.fromARGB(255, 203, 202, 202),
    tertiary: Colors.black,
  ),
);
