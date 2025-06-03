import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() => ThemeData(
    colorScheme: const ColorScheme.highContrastDark(
      primary: Color.fromARGB(255, 0, 225, 255),
    ),
  );
}
