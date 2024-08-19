import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.white),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Color.fromARGB(255, 61, 61, 61),
    secondary: Colors.grey,
    tertiary: Colors.black,
  ),
);
