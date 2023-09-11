import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  String email = 'email';
  String phoneNumber = 'phone_number';
  String chatId = 'chat_id';
  String name = "name";
  String channel = "channel";

  static AppPreferences? _instance;

  static Future<AppPreferences> get instance async {
    return await getInstance();
  }

  static SharedPreferences? _spf;

  AppPreferences._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<AppPreferences> getInstance() async {
    _instance ??= AppPreferences._();
    if (_spf == null) {
      await _instance?._init();
    }
    return _instance ?? AppPreferences._();
  }


  void setString(String value, String key) {
    _spf?.setString(key, value);
  }

  String? getString(String key) {
    return _spf?.getString(key);
  }
}