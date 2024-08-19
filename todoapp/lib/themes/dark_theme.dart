import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.black),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.grey,
    secondary: Color.fromARGB(255, 61, 61, 61),
    tertiary: Colors.white,
  ),
);
