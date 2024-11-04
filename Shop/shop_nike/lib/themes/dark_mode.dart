import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  // brightness: Brightness.light,
//SET TEXT APP
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.red,
    ),
    displayLarge: TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  ),
//SET COLOR APP

  appBarTheme: const AppBarTheme(color: Colors.black),
  colorScheme: const ColorScheme.dark(
    surface: Colors.white,
    primary: Color.fromARGB(255, 227, 227, 227),
    secondary: Colors.black,
  ),
);
