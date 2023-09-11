import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepository implements LocalRepository {
  SharedPreferences? _prefs;

  get pref => _prefs;

  SharedPreferenceRepository() {
    init();
  }

  @override
  Future init() async {
    _prefs = await SharedPreferences.getInstance();
    isInitialized = true;
  }

  @override
  Future<String?> getData(String key) async {
    if (!isInitialized) await init();

    return _prefs?.getString(key);
  }

  @override
  Future<dynamic> saveData(String key, String data) async {
    if (!isInitialized) await init();
    _prefs?.setString(key, data);
  }

  @override
  Future<bool> checkCache(String key) async {
    if (!isInitialized) await init();
    var time = _prefs?.getInt('$key-time');
    if (kDebugMode) {
      print(
          'cache: $key, $time, ${_prefs?.getInt('$key-time')} ${DateTime.fromMillisecondsSinceEpoch(time ?? 001)}');
    }
    if (time == null) return false;
    // return
    try {
      return !(time).isPast;
    } catch (e) {
      return false;
    }
  }

  @override
  void saveTime(String? key, int? duration) async {
    if (!isInitialized) await init();
    // duration = duration?.secondsToMilliseconds;
    if (key != null && key.isNotEmpty && duration != null && !duration.isNaN) {
      _prefs?.setInt('$key-time', duration);
    }
  }

  @override
  void clearCache() async {
    if (!isInitialized) await init();
    _prefs?.clear();
  }

  @override
  Future<int?> getTime(String key) async {
    if (!isInitialized) await init();
    return _prefs?.getInt(key);
  }

  @override
  void removeData(String key) async {
    if (!isInitialized) await init();
    _prefs?.remove(key);
    _prefs?.remove('$key-time');
  }

  @override
  bool isInitialized = false;
}
