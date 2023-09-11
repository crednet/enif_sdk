// import 'package:mobile/core/extensions/map.dart';

import 'package:data_repository/utils/index.dart';

import 'preference_store.dart';

class MapPreferenceStore implements PreferenceStore {
  late Map<String, dynamic> box;
  MapPreferenceStore() {
    initStore();
  }
  @override
  Future initStore() async {
    box = {};
  }

  @override
  Future<void> delete(String key) => box.remove(key);

  @override
  Future<bool> getBool(String key, bool defaultValue) async {
    return box.getKey<bool>(key) ?? defaultValue;
  }

  @override
  Future<int?> getInt(String key) async {
    return box.getKey<int>(key);
  }

  @override
  Future<String?> getString(String key) async {
    return box.getKey<String>(key);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return box.getKey<List<String>>(key);
  }

  @override
  Future<void> setBool(String key, bool value) async =>
      box.addAll({key: value});

  @override
  Future<void> setInt(String key, int value) async => box.addAll({key: value});

  @override
  Future<void> setString(String key, String value) async =>
      box.addAll({key: value});

  @override
  Future<void> setStringList(String key, List<String> value) async =>
      box.addAll({key: value});
}
