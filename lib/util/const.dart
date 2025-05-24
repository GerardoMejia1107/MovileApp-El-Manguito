import 'package:flutter/material.dart';

class Constants {
  static const String appName = "Foody Bite";

  // Colors for theme
  static const Color lightPrimary = Color(0xfffcfcff);
  static const Color darkPrimary = Colors.black;
  static const Color lightAccent = Color(0xff5563ff);
  static const Color darkAccent = Color(0xff5563ff);
  static const Color lightBG = Color(0xfffcfcff);
  static const Color darkBG = Colors.black;
  static final Color ratingBG = Colors.yellow.shade600;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    colorScheme: ColorScheme.light(
      primary: lightPrimary,
      secondary: lightAccent,
      background: lightBG,
    ),
    scaffoldBackgroundColor: lightBG,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(color: darkBG),
      backgroundColor: lightPrimary,
      elevation: 0,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    colorScheme: ColorScheme.dark(
      primary: darkPrimary,
      secondary: darkAccent,
      background: darkBG,
    ),
    scaffoldBackgroundColor: darkBG,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(color: lightBG),
      backgroundColor: darkPrimary,
      elevation: 0,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
  );
}
