import 'dart:convert';

import 'package:data_repository/data_repository.dart';
import 'package:enif/constants/api_urls.dart';
import 'package:enif/data/remote/interceptor/json_interceptor.dart';
import 'package:enif/enif.dart';
import 'package:enif/models/chat_session.dart';
import 'package:enif/models/faq.dart';
import 'package:enif/models/models.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:enif/models/send_device_token_model.dart';
import 'package:enif/modules/chat/data/dto/send_device_token_dto.dart';
import 'package:enif/modules/chat/data/dto/send_image_dto.dart';
import 'package:enif/modules/chat/data/dto/sent_chat_dto.dart';
import 'package:http/http.dart' as http;

import '../../models/enif_error.dart';

class EnifApi {
  String get baseUrl => EnifController().env.baseUrl;

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

  ApiRequest<List<ChatSession>, ChatSession> getChatHistory(
      String email, String businessId) {
    return ApiRequest<List<ChatSession>, ChatSession>(
        baseUrl: baseUrl,
        path: ApiUrls.chatHistory(email),
        method: ApiMethods.get,
        dataKey: 'ticket',
        query: {'businessId': businessId},
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json"
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }

  ApiRequest<List<Message>, Message> getChatMessages(
      String email, String businessId, String chatId) {
    return ApiRequest<List<Message>, Message>(
        baseUrl: baseUrl,
        path: ApiUrls.chatMessages(chatId),
        method: ApiMethods.get,
        dataKey: 'data',
        query: {'businessId': businessId, "chatId": chatId},
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json",
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }

  ApiRequest<SendChatModel, SendChatModel> sendChat(SendChatDto body) {
    return ApiRequest<SendChatModel, SendChatModel>(
        baseUrl: baseUrl,
        path: ApiUrls.sendChat,
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

  ApiRequest<bool, bool> ticketStatus(String ticketId) {
    return ApiRequest<bool, bool>(
        baseUrl: baseUrl,
        path: ApiUrls.ticketStatus(ticketId),
        method: ApiMethods.post,
        dataKey: 'read',
        nestedKey: 'data',
        body: {},
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json",
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }

  ApiRequest<bool, bool> updateTicketStatus(String ticketId) {
    return ApiRequest<bool, bool>(
        baseUrl: baseUrl,
        path: ApiUrls.updateTicketStatus(ticketId),
        method: ApiMethods.post,
        dataKey: 'read',
        nestedKey: 'data',
        body: {},
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json",
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }

  ApiRequest<SendDeviceTokenModel, SendDeviceTokenModel> sendDeviceToken(
      SendDeviceTokenDto body, ticketId) {
    return ApiRequest<SendDeviceTokenModel, SendDeviceTokenModel>(
      baseUrl: baseUrl,
      path: ApiUrls.sendDeviceToken(ticketId),
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
      ],
    );
  }

  ApiRequest<List<String>, String> sendImage(
      SendImageDto body, String businessId) {
    return ApiRequest<List<String>, String>(
        baseUrl: baseUrl,
        path: ApiUrls.sendImage(businessId),
        method: ApiMethods.post,
        dataKey: 'data',
        body: body.toJson(),
        // isMultipart: true,
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json",
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }

  Future<dynamic> uploadImages(
      List<String> imagePaths, String businessId) async {
    Uri url = Uri.parse('$baseUrl/${ApiUrls.sendImage(businessId)}');
    http.MultipartRequest request = http.MultipartRequest(ApiMethods.post, url);

    for (int i = 0; i < imagePaths.length; i++) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('images', imagePaths[i]);

      request.files.add(multipartFile);
    }

    dynamic responseList = [];

    try {
      http.StreamedResponse streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        responseList = List<String>.from(responseData['data']);
        return responseList;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
