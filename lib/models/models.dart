import 'package:data_repository/data_repository.dart';
import 'package:enif/models/enif_error.dart';

import 'faq.dart';
import 'chat_session.dart';

class Models {
  static Map<Type, JsonFactory> factories = {
    EnifError: (json) => EnifError.fromJson(json),
    Faq: (json) => Faq.fromJson(json),
    ChatSession: (json) => ChatSession.fromJson(json),
  };
}
