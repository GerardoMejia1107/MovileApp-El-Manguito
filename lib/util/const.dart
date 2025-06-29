import 'package:flutter/material.dart';

class Constants {
  static const String appName = "Foody Bite";

  // Paleta de colores base
  static const Color primary = Color(0xFF275448);   // Verde bosque
  static const Color secondary = Color(0xFFefcb69); // Amarillo suave
  static const Color third = Color(0xFF97c1e5);     // Azul claro

  static const Color accentGreen = Color(0xFFa7d5a2); // Verde claro
  static const Color darkBG = Color(0xFF060604);     // Fondo oscuro
  static const Color lightBG = Color(0xFFFFFFFF);     // Fondo claro

  static final Color ratingBG = secondary;

  // =======================
// ✏️ Estilos de texto
// =======================
  static const TextTheme lightTextTheme = TextTheme(
    titleLarge: TextStyle( // Para títulos como "Bienvenido"
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle( // Para subtítulos o descripción
      fontSize: 16,
      color: Colors.black87,
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.white70,
    ),
  );


  // =======================
  // 🔆 Tema Claro
  // =======================
  static final ThemeData lightTheme = ThemeData(
    textTheme: lightTextTheme,
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: lightBG,
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: secondary,
      background: lightBG,
      surface: lightBG,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondary,
      foregroundColor: Colors.black,
      elevation: 6,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primary,
    ), bottomAppBarTheme: BottomAppBarTheme(color: lightBG),
  );

  // =======================
  // 🌙 Tema Oscuro
  // =======================
  static final ThemeData darkTheme = ThemeData(
    textTheme: darkTextTheme,
    brightness: Brightness.dark,
    primaryColor: third,
    scaffoldBackgroundColor: darkBG,
    colorScheme: const ColorScheme.dark(
      primary: third,
      secondary: secondary,
      background: darkBG,
      surface: Color(0xFF1E1E1E),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: third,
      foregroundColor: darkBG,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondary,
      foregroundColor: Colors.black,
      elevation: 6,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: third,
    ), bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFF1E1E1E)),
  );


}


