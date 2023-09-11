/// interface for shared preference storage
abstract class PreferenceStore {
  PreferenceStore() {
    initStore();
  }

  /// initialize the store instance
  Future initStore();

  /// save a boolean value to preference store
  Future<void> setBool(String key, bool value);

  /// get a boolean value from preference store
  Future<bool> getBool(String key, bool defaultValue);

  /// get a string from preference store
  Future<String?> getString(String key);

  /// set a string in preference store
  Future<void> setString(String key, String value);

  Future<List<String>?> getStringList(String key);

  Future<void> setStringList(String key, List<String> value);

  /// save a value to preference store as integer
  Future<void> setInt(String key, int value);

  /// get an integer from preference store
  Future<int?> getInt(String key);

  /// delete a value from preference store by key
  Future<void> delete(String key);
}
