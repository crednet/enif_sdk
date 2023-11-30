import 'package:data_repository/data_repository.dart';
import 'package:enif/data/local/shared_preference_repository.dart';
import 'package:enif/data/remote/enif_api.dart';
import 'package:enif/models/chat_session.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:enif/models/send_device_token_model.dart';
import 'package:enif/modules/chat/data/dto/init_chat_dto.dart';
import 'package:enif/modules/chat/data/dto/send_device_token_dto.dart';
import 'package:enif/modules/chat/data/dto/send_image_dto.dart';
import 'package:enif/modules/chat/data/dto/sent_chat_dto.dart';
import 'package:enif/modules/chat/view_model/enif_controller.dart';
import 'package:flutter/foundation.dart';

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

  Future<ApiResponse<List<Message>, Message>> getChatMessages(
      String email, String businessId, String chatId) {
    return handleRequest(_api.getChatMessages(email, businessId, chatId));
  }

  Future<ApiResponse<List<ChatSession>, ChatSession>> getChatHistory(
      String email, String businessId) {
    return handleRequest(_api.getChatHistory(email, businessId));
  }

  Future<ApiResponse<SendDeviceTokenModel, SendDeviceTokenModel>>
      sendDeviceToken(String ticketId) {
    return handleRequest(_api.sendDeviceToken(
        SendDeviceTokenDto(firebaseToken: EnifController.deviceToken ?? ''), ticketId));
  }

  Future<ApiResponse<List<String>, String>> sendImage(
      SendImageDto image, String businessId) {
    return handleRequest(_api.sendImage(image, businessId));
  }

  Future<dynamic> uploadImages(
      List<String> imagePaths, String businessId) async {
    try {
      dynamic responseList = await _api.uploadImages(imagePaths, businessId);
      return responseList;
    } catch (error) {
      if (kDebugMode) {
        print('Repository error: $error');
      }
      return [];
    }
  }
}
