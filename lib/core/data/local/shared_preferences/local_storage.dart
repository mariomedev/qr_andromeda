abstract class LocalStorage {
  Future<void> saveBool(String key, bool value);
  Future<bool?> getBool(String key);
}
