library enif;

import 'package:enif/models/enif_user_params.dart';
import 'package:flutter/material.dart';

/// EnifController is a singleton class that is used to store global variables
class EnifController {
  static final EnifController _instance = EnifController._internal();

  ValueNotifier<EnifUserParams?> userParams = ValueNotifier(null);

  factory EnifController() {
    return _instance;
  }

  EnifController._internal();

  String? _businessId;

  static setUser(EnifUserParams userParams) {
    _instance.userParams.value = userParams;
  }

  static logout() {
    _instance.userParams.value = null;
  }

  static setBusinessId(String businessId) {
    _instance._businessId = businessId;
  }

  static String? get businessId => _instance._businessId;
}
