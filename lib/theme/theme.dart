import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.greenAccent,
    primary: Colors.green, // Added primary color for clarity
  ),
  primaryColor: Colors.white,
  secondaryHeaderColor: Colors.white10,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.green,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.greenAccent, // Text color
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
    surface: Colors.green,
    primary: Colors.green, // Added primary color for clarity
  ),
  primaryColor: Colors.white70,
  secondaryHeaderColor: Colors.white60,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.green,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white70,
      backgroundColor: Colors.green, // Text color
      shadowColor: Colors.black,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
