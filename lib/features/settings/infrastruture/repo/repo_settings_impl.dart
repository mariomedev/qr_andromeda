import 'dart:ui';

import '../../domain/domain.dart';

class RepoSettingsImpl implements RepoSettings {
  final DataSettings dataSettings;

  RepoSettingsImpl({required this.dataSettings});

  @override
  Future<Color> getColorTheme({required String key}) async {
    return await dataSettings.getColorTheme(key: key);
  }

  @override
  Future<bool> getIsDarkTheme({required String key}) async {
    return await dataSettings.getIsDarkTheme(key: key);
  }

  @override
  Future<void> setColorTheme({
    required String key,
    required Color value,
  }) async {
    await dataSettings.setColorTheme(key: key, value: value);
  }

  @override
  Future<void> setIsDarkTheme({
    required String key,
    required bool value,
  }) async {
    await dataSettings.setIsDarkTheme(key: key, value: value);
  }
}
