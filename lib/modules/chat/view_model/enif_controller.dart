library enif;

import 'dart:convert';

import 'package:enif/data/local/preference_store/shared_preference_store.dart';
import 'package:enif/models/enif_user_params.dart';
import 'package:enif/modules/faq/repository/faq_repository.dart';
import 'package:flutter/foundation.dart';

import '../../../models/chat_session.dart';
import 'chat_connection_view_model.dart';

/// EnifController is a singleton class that is used to store global variables
class EnifController {
  final SharedPreferenceStore _sharedPreferenceStore = SharedPreferenceStore();
  static final EnifController _instance = EnifController._internal();

  ValueNotifier<EnifUserParams?> userParams = ValueNotifier(null);

  ValueNotifier<ChatSession?> chatSession = ValueNotifier(null);

  factory EnifController() {
    return _instance;
  }

  EnifController._internal();

  String? _businessId;

  static setChatSession(ChatSession chatSession) {
    _instance.chatSession.value = chatSession;
    _instance._sharedPreferenceStore.setString(
        'chatsession-${_instance._businessId}-${chatSession.email}',
        jsonEncode(chatSession.toJson()));
  }

  static setUser(EnifUserParams userParams,
      {bool autoInitialize = true}) async {
    _instance.userParams.value = userParams;

    if (!autoInitialize) return;
    try {
      if (businessId != null) {
        var u = await _instance._sharedPreferenceStore.getString(
            'chatsession-${_instance._businessId}-${userParams.email}');
        ChatSession? session;
        if (u != null) session = ChatSession.fromJson(jsonDecode(u));

        if (session?.id != null) {
          setChatSession(session!);
        } else {
          ChatConnectionViewModel()
            ..emailChanged(userParams.email)
            ..nameChanged(userParams.name)
            ..phoneNoChanged(userParams.phoneNo)
            ..initChat();
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static logout() {
    _instance.userParams.value = null;
    _instance.chatSession.value = null;
  }

  static reset() {
    _instance.chatSession.value = null;
  }

  static setBusinessId(String businessId) {
    _instance._businessId = businessId;

    FaqRepository().getFaqs(false); // ensure faqs are loaded
  }

  static String? get businessId => _instance._businessId;
}
