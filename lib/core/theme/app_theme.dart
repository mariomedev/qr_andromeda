import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/settings/presentation/provider/theme_provider.dart';

final themeProvider = Provider<ThemeData>((ref) {
  final isDarkMode = ref.watch(isDarkModeProvider);
  final colorTheme = ref.watch(themeColorProvider);

  if (isDarkMode) {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        primary: colorTheme,
      ),
    );
  }
  if (!isDarkMode) {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: colorTheme,
      ),
    );
  }
  return ThemeData();
});
