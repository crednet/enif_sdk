import 'package:data_repository/data_repository.dart';
import 'package:enif/data/local/shared_preference_repository.dart';
import 'package:enif/data/remote/enif_api.dart';
import 'package:enif/models/chat_session.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:enif/modules/chat/data/dto/init_chat_dto.dart';
import 'package:enif/modules/chat/data/dto/sent_chat_dto.dart';

class ChatRepository extends DataRepository {
  final _api = EnifApi();

  ChatRepository()
      : super(SharedPreferenceRepository(),
            RemoteRepository(HttpApiProvider(), 'An error occured'));

  Future<ApiResponse<ChatSession, ChatSession>> initChat(InitChatDto body) {
    return handleRequest(_api.initChat(body));
  }

  Future<ApiResponse<SendChatModel, SendChatModel>> sendChat(SendChatDto body) {
    return handleRequest(_api.sendChat(body));
  }
}
