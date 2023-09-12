import 'package:data_repository/data_repository.dart';
import 'package:enif/constants/api_urls.dart';
import 'package:enif/data/remote/interceptor/json_interceptor.dart';
import 'package:enif/models/chat_session.dart';
import 'package:enif/models/faq.dart';
import 'package:enif/models/get_user_chat_model.dart';
import 'package:enif/models/models.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:enif/modules/chat/data/dto/init_chat_dto.dart';

import '../../models/enif_error.dart';

class EnifApi {
  String get baseUrl => "https://enif-business-production.up.railway.app";

  ApiRequest<List<Faq>, Faq> getFaqs(String businessId) {
    return ApiRequest<List<Faq>, Faq>(
        baseUrl: baseUrl,
        path: ApiUrls.faq(businessId),
        method: ApiMethods.get,
        dataKey: '',
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json",
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }

  ApiRequest<ChatSession, ChatSession> initChat(InitChatDto body) {
    return ApiRequest<ChatSession, ChatSession>(
        baseUrl: baseUrl,
        path: ApiUrls.initChat,
        method: ApiMethods.post,
        dataKey: '',
        body: body.toJson(),
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json",
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }


  ApiRequest<List<GetUserChatModel>, GetUserChatModel> getChatHistory(String email) {
    return ApiRequest<List<GetUserChatModel>, GetUserChatModel>(
        baseUrl: baseUrl,
        path: ApiUrls.chatHistory(email),
        method: ApiMethods.get,
        dataKey: '',
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json",
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }

  ApiRequest<SendChatModel, SendChatModel> sendChat(String chatId, String businessId, String channel, String customer, String promptMsg) {
    return ApiRequest<SendChatModel, SendChatModel>(
        baseUrl: baseUrl,
        path: ApiUrls.sendChat,
        method: ApiMethods.post,
        dataKey: '',
        body: {
          "chatId": chatId,
          "businessId": businessId,
          "channel": channel,
          "customer": customer,
          "promptMsg": promptMsg
        },
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json",
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }
 
}
