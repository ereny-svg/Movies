import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF121312);
  static const Color darkGray = Color(0xFF1A1A1A);
  static const Color gray = Color(0xFFB5B4B4);
  static const Color lightGray = Color(0xFFC6C6C6);
  static const Color darkYellow = Color(0xFFFFA90A);
  static const Color lightYellow = Color(0xFFF7B539);
  static const Color white = Color(0xFFFFFFFF);
  static const Color neutralGray = Color(0xFF514F4F);
  static const Color dark2Gray = Color(0xFF343534);

  static ThemeData darkTheme = ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: primary,
      textTheme: const TextTheme(
          titleMedium: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: white),
          titleSmall: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w400, color: gray),
   
              ),
            
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        unselectedItemColor: lightGray,
        selectedItemColor: darkYellow,
        showUnselectedLabels: true,
        backgroundColor: darkGray,
      ));
}
