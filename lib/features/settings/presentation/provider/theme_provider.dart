import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeColorProvider = StateProvider<Color>((ref) {
  return Colors.red;
});

final isDarkModeProvider = StateProvider<bool>((ref) {
  return true;
});
