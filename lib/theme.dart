import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: 'K2D',
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black, toolbarTextStyle: TextStyle()),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromRGBO(169, 241, 168, 1.0),
    onPrimary: Color.fromRGBO(198, 98, 83, 1.0),
    secondary: Color.fromRGBO(169, 241, 168, 1.0),
    onSecondary: Color.fromRGBO(198, 98, 83, 1.0),
    error: Colors.red,
    onError: Colors.white,
    background: Colors.black,
    onBackground: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
    onSurfaceVariant: Colors.black
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(color: Colors.white, fontSize: 42),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 28),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
    bodySmall: TextStyle(color: Colors.white, fontSize: 14),
    labelLarge: TextStyle(color: Colors.black, fontSize: 16),
    labelMedium: TextStyle(color: Colors.black, fontSize: 12),
    labelSmall: TextStyle(color: Colors.black, fontSize: 10),
  ),
  scaffoldBackgroundColor: Colors.black,
);

final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(169, 241, 168, 1.0),
      onPrimary: Color.fromRGBO(198, 98, 83, 1.0),
      secondary: Color.fromRGBO(169, 241, 168, 1.0),
      onSecondary: Color.fromRGBO(198, 98, 83, 1.0),
      error: Colors.red,
      onError: Colors.black,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: Colors.black, fontSize: 42),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 28),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 20),
      bodySmall: TextStyle(color: Colors.black, fontSize: 14),
      labelLarge: TextStyle(color: Colors.black, fontSize: 16),
      labelMedium: TextStyle(color: Colors.black, fontSize: 12),
      labelSmall: TextStyle(color: Colors.black, fontSize: 10),
    ),
    scaffoldBackgroundColor: Colors.white);
