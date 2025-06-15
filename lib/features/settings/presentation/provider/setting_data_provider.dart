import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../../infrastruture/infrastruture.dart';
import 'search_preference_provider.dart';

final settingProvider = Provider<SettingNotifier>((ref) {
  final localStorage = ref.watch(settingPreferenceProvider);
  final datasource = DataSearchPreferencesImpl(localStorage: localStorage);
  return SettingNotifier(
    repoSettings: RepoSettingsImpl(dataSettings: datasource),
  );
});

class SettingNotifier {
  final RepoSettings repoSettings;

  SettingNotifier({required this.repoSettings});

  Future<Color> getThemeColor(String key) async {
    return await repoSettings.getColorTheme(key: key);
  }

  Future<void> setThemeColor(String key, Color color) async {
    return await repoSettings.setColorTheme(key: key, value: color);
  }

  Future<bool> getIsDarkMode(String key) async {
    return await repoSettings.getIsDarkTheme(key: key);
  }

  Future<void> setIsDarkMode(String key, bool value) async {
    return await repoSettings.setIsDarkTheme(key: key, value: value);
  }
}
