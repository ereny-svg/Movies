import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF121312);
  static const Color darkGray = Color(0xFF1A1A1A);
  static const Color gray = Color(0xFFB5B4B4);
  static const Color lightGray = Color(0xFFC6C6C6);
  static const Color darkYellow = Color(0xFFFFA90A);
  static const Color lightYellow = Color(0xFFF7B539);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: primary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          unselectedItemColor: lightGray,
          selectedItemColor: darkYellow,
          showUnselectedLabels: true,
          backgroundColor: darkGray,      
    )
  );
}
