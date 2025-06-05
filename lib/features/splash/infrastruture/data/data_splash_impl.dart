import 'package:qr_andromeda/core/data/data.dart';

import '../../domain/domain.dart';

class DataSplashImpl implements DataSplash {
  final LocalStorage localStorage;

  DataSplashImpl(this.localStorage);
  @override
  Future<bool?> getStatusOnboarding(String key) async {
    return await localStorage.getBool(key);
  }

  @override
  Future<void> saveStatusOnboarding(String key, bool value) async {
    await localStorage.saveBool(key, value);
  }
}
