import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() => ThemeData(
    colorScheme: ColorScheme.highContrastDark(
      primary: Color.fromARGB(255, 3, 238, 218),
    ),
  );
}
