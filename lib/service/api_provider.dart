import 'package:dio/dio.dart';
import 'package:enif/common/stringHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/get_user_chats_bloc.dart';
import '../bloc/send_chat_bloc.dart';
import '../models/get_user_chat_model.dart';
import '../models/send_chat_model.dart';
import 'api_client.dart';

class ApiProvider {
  Future<List<GetUserChatModel>?> getUserChatAPI(
      GetUserChatRefreshEvent event, Emitter<GetUserChatState> emit) async {
    emit(GetUserChatLoadingState());
    try {
      final client = await ApiClient.dioClient();
      Response response = await client.get("api/chat/user/${event.email}");
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = response.data;
        List<GetUserChatModel> model = jsonResponse
            .map((json) => GetUserChatModel.fromJson(json))
            .toList();
        emit(GetUserChatSuccessState(model));
        return model;
      } else {
        emit(GetUserChatErrorState(response.statusMessage ?? ""));
        List<dynamic> jsonResponse = response.data;
        return jsonResponse
            .map((json) => GetUserChatModel.fromJson(json))
            .toList();
      }
    } on DioError catch (error) {
      if (error.response != null) {
        emit(GetUserChatErrorState(error.message ?? ""));
        return null;
      }
    }
    return null;
  }

  Future<SendChatModel?> sendChatAPI(
      SendChatRefreshEvent event, Emitter<SendChatState> emit) async {
    emit(SendChatLoadingState());
    try {
      final client = await ApiClient.dioClient();
      Response response = await client.post("api/chat/send", data: {
        "chatId": event.chatId,
        "businessId": StringHelper.businessId,
        "channel": event.channel,
        "customer": event.customer,
        "promptMsg": event.promptMsg
      });
      // print("response.data ${response.data}");
      SendChatModel data = SendChatModel.fromJson(response.data);
      if (response.statusCode == 200) {
        emit(SendChatSuccessState(data));
      } else {
        emit(SendChatErrorState(response.statusMessage ?? ""));
      }
      return data;
    } on DioError catch (error) {
      if (error.response != null) {
        emit(SendChatErrorState(error.message ?? ""));
        return null;
      }
    }
    return null;
  }
}
