import 'package:flutter/material.dart';

abstract class DataSettings {
  Future<Color> getColorTheme({required String key});
  Future<void> setColorTheme({required String key, required Color value});
  Future<bool> getIsDarkTheme({required String key});
  Future<void> setIsDarkTheme({required String key, required bool value});
}
