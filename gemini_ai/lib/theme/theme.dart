import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.black,
    primary: const Color.fromARGB(255, 255, 255, 255),
    secondary: const Color.fromARGB(255, 187, 54, 244),
  ),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.black,
    secondary: Color.fromARGB(255, 68, 143, 235),
  ),
);
