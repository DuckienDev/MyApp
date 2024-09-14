import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(color: Colors.black),
  colorScheme: const ColorScheme.dark(
    primary: Colors.grey,
    surface: Color.fromARGB(255, 227, 227, 227),
    secondary: Colors.white,
  ),
);
