import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 204, 232, 226),
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 204, 232, 226),
        brightness: Brightness.dark,
      ),
    );
  }
}
