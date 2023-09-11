import 'package:shared_preferences/shared_preferences.dart';

import 'preference_store.dart';

class SharedPreferenceStore implements PreferenceStore {
  SharedPreferences? _prefs;

  get pref => _prefs;
  @override
  Future<void> initStore() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setBool(String key, bool value) async {
    if (_prefs == null) await initStore();
    _prefs?.setBool(key, value);
  }

  @override
  Future<bool> getBool(String key, bool defaut) async {
    if (_prefs == null) await initStore();
    try {
      return _prefs?.getBool(key) ?? defaut;
    } catch (e) {
      setBool(key, defaut);
      return defaut;
    }
  }

  @override
  Future<String?> getString(String key) async {
    if (_prefs == null) await initStore();
    try {
      return _prefs?.getString(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setString(String key, String value) async {
    if (_prefs == null) await initStore();
    await _prefs?.setString(key, value);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    if (_prefs == null) await initStore();
    try {
      return _prefs?.getStringList(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    if (_prefs == null) await initStore();
    await _prefs?.setStringList(key, value);
  }

  @override
  Future<void> setInt(String key, int value) async {
    if (_prefs == null) await initStore();
    await _prefs?.setInt(key, value);
  }

  @override
  Future<void> delete(String key) async {
    if (_prefs == null) await initStore();
    await _prefs?.remove(key);
  }

  @override
  Future<int?> getInt(String key) async {
    if (_prefs == null) await initStore();
    try {
      return _prefs?.getInt(key);
    } catch (e) {
      return null;
    }
  }
}
