import 'package:flutter/material.dart';
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFE0E0E0),
    primary: Color(0xFF0000FF),
    secondary: Colors.black45,
    surfaceBright: Colors.white, // Background color for light mode
  ),
  primaryColor: Colors.white,
  secondaryHeaderColor: Colors.white10,
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF0000FF),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black38,
      shadowColor: Colors.black,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFFE0E0E0),
    primary: Color(0xFF00008a),
    secondary: Colors.black45,
    surfaceBright: Colors.black87, // Background color for dark mode
  ),
  primaryColor: Colors.white70,
  secondaryHeaderColor: Colors.white60,
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF00008a),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white70,
      backgroundColor: Colors.black38,
      shadowColor: Colors.white54,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
