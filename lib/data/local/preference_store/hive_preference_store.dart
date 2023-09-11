// import 'package:hive/hive.dart';

// import 'preference_store.dart';

// class HivePreferenceStore implements PreferenceStore {
//   late LazyBox box;

//   @override
//   Future initStore() async {
//     box = await Hive.openLazyBox('preference-store');
//   }

//   @override
//   Future<void> delete(String key) => box.delete(key);

//   @override
//   Future<bool> getBool(String key, bool defaultValue) async {
//     var result = await box.get(key, defaultValue: defaultValue);
//     if (result != null && result is bool) return result;
//     return defaultValue;
//   }

//   @override
//   Future<int?> getInt(String key) async {
//     var result = await box.get(key);
//     if (result is int) return result;
//     return null;
//   }

//   @override
//   Future<String?> getString(String key) async {
//     var result = await box.get(key);
//     if (result is String) return result;
//     return null;
//   }

//   @override
//   Future<List<String>?> getStringList(String key) async {
//     var result = await box.get(key);
//     if (result is List<String>) return result;
//     return null;
//   }

//   @override
//   Future<void> setBool(String key, bool value) => box.put(key, value);

//   @override
//   Future<void> setInt(String key, int value) => box.put(key, value);

//   @override
//   Future<void> setString(String key, String value) => box.put(key, value);

//   @override
//   Future<void> setStringList(String key, List<String> value) =>
//       box.put(key, value);
// }
