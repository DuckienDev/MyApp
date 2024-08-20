import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.black),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.grey,
    secondary: Color.fromARGB(255, 44, 44, 44),
    tertiary: Colors.white,
  ),
);
