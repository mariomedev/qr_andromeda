import 'dart:ui';

import 'package:qr_andromeda/features/settings/domain/data/data_settings.dart';

import '../../../../core/core.dart';

class DataSearchPreferencesImpl implements DataSettings {
  final LocalStorage localStorage;

  DataSearchPreferencesImpl({required this.localStorage});

  @override
  Future<Color> getColorTheme({required String key}) async {
    final color = await localStorage.getInt(key);
    final Color newColor = Color(color ?? 4282473701);
    return newColor;
  }

  @override
  Future<bool> getIsDarkTheme({required String key}) async {
    return await localStorage.getBool(key) ?? true;
  }

  @override
  Future<void> setColorTheme({
    required String key,
    required Color value,
  }) async {
    final color = value.toARGB32();
    await localStorage.setInt(key, color);
  }

  @override
  Future<void> setIsDarkTheme({
    required String key,
    required bool value,
  }) async {
    await localStorage.saveBool(key, value);
  }
}
