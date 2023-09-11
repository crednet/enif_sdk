import 'package:data_repository/data_repository.dart';
import 'package:enif/data/local/shared_preference_repository.dart';
import 'package:enif/data/remote/enif_api.dart';
import 'package:enif/models/new_chat_model.dart';
import 'package:enif/modules/chat/data/dto/init_chat_dto.dart';

class ChatRepository extends DataRepository {
  final _api = EnifApi();

  ChatRepository()
      : super(SharedPreferenceRepository(),
            RemoteRepository(HttpApiProvider(), 'An error occured'));

  Future<ApiResponse<NewChatModel, NewChatModel>> initChat(InitChatDto body) {
    return handleRequest(_api.initChat(body));
  }
}
