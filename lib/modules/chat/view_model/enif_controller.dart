library enif;

import 'package:enif/models/enif_user_params.dart';
import 'package:enif/modules/faq/repository/faq_repository.dart';
import 'package:flutter/material.dart';

import '../../../models/chat_session.dart';

/// EnifController is a singleton class that is used to store global variables
class EnifController {
  // final SharedPreferenceStore _sharedPreferenceStore = SharedPreferenceStore();
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
    // _instance._sharedPreferenceStore.setString(
    //     'chat-session-${_instance._businessId}-${chatSession.email}',
    //     jsonEncode(chatSession.toJson()));
  }

  static setUser(EnifUserParams userParams) async {
    _instance.userParams.value = userParams;
    // var user = await _instance._sharedPreferenceStore.getString('');
    // if (businessId != null) {
    //   ChatConnectionViewModel()
    //     ..emailChanged(userParams.email)
    //     ..nameChanged(userParams.name)
    //     ..phoneNoChanged(userParams.phoneNo)
    //     ..initChat();
    // }
  }

  static logout() {
    _instance.userParams.value = null;
    _instance.chatSession.value = null;
  }

  static setBusinessId(String businessId) {
    _instance._businessId = businessId;

    FaqRepository().getFaqs(false); // ensure faqs are loaded
  }

  static String? get businessId => _instance._businessId;
}
