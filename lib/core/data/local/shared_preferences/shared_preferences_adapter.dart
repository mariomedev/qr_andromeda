import 'package:qr_andromeda/core/data/local/shared_preferences/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter implements LocalStorage {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  @override
  Future<bool?> getBool(String key) async {
    final res = asyncPrefs.getBool(key);
    return res;
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await asyncPrefs.setBool(key, value);
  }
}
