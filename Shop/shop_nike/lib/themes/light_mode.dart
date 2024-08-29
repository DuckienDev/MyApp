import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  // brightness: Brightness.light,
//SET TEXT APP
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 15,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 13,
      color: Colors.black,
    ),
  ),
//SET COLOR APP

  appBarTheme: const AppBarTheme(color: Colors.black),
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 227, 227, 227),
    surface: Color.fromARGB(255, 230, 230, 230),
    secondary: Colors.black,
  ),
);
