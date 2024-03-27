import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFF4E9D5),
      onPrimary: Color(0xFFF4E9D5),
      secondary: Color(0xFF1D2148),
      onSecondary: Color(0xFF1D2148),
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      background: Color(0xFFE1585E),
      onBackground: Color(0xFFE1585E),
      surface: Color(0xFF202020),
      onSurface: Color(0xFF202020),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFF4E9D5),
      onPrimary: Color(0xFFF4E9D5),
      secondary: Color(0xFF1D2148),
      onSecondary: Color(0xFF1D2148),
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      background: Color(0xFF212649),
      onBackground: Color(0xFF212649),
      surface: Color(0xFFF1F2F3),
      onSurface: Color(0xFFF1F2F3),
    ),
  );
}
