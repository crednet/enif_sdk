import 'package:data_repository/data_repository.dart';
import 'package:enif/enif.dart';
import 'package:enif/models/new_chat_model.dart';
import 'package:enif/modules/chat/data/dto/init_chat_dto.dart';
import 'package:enif/modules/chat/repository/chat_repository.dart';
import 'package:flutter/foundation.dart';

class ChatConnectionState extends Object {
  final bool isLoading;
  final String? name, phoneNo, email;

  ChatConnectionState({
    this.name,
    this.phoneNo,
    this.email,
    this.isLoading = false,
  });

  ChatConnectionState copyWith(
          {bool? isLoading, String? name, String? phoneNo, String? email}) =>
      ChatConnectionState(
        isLoading: isLoading ?? false,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNo: phoneNo ?? this.phoneNo,
      );

  @override
  bool operator ==(Object other) {
    return (other is ChatConnectionState &&
        other.runtimeType == runtimeType &&
        other.isLoading == isLoading &&
        other.phoneNo == phoneNo &&
        other.email == email &&
        other.name == name);
  }

  @override
  int get hashCode => Object.hash(isLoading, email, phoneNo, name);
}

class SuccessChatConnectionState extends ChatConnectionState {
  final NewChatModel chatSession;
  SuccessChatConnectionState(ChatConnectionState state, this.chatSession)
      : super(
            isLoading: false,
            name: state.name,
            phoneNo: state.phoneNo,
            email: state.email);
}

class ErrorChatConnectionState extends ChatConnectionState {
  final ApiError error;
  ErrorChatConnectionState(ChatConnectionState state, this.error)
      : super(
            isLoading: false,
            name: state.name,
            phoneNo: state.phoneNo,
            email: state.email);
}

class ChatConnectionViewModel extends ValueNotifier<ChatConnectionState> {
  final _repository = ChatRepository();

  ChatConnectionViewModel() : super(ChatConnectionState());

  Future<void> initChat() async {
    if (EnifController.businessId == null) {
      throw Exception(
          'BusinessId is must be set, please call "EnifController.setBusinessId("")" before calling this method');
    }
    value = value.copyWith(isLoading: true);
    var response = await _repository.initChat(InitChatDto(
        customer: value.name ?? '',
        phoneNo: value.phoneNo ?? '',
        email: value.email ?? '')); // fetch from cache

    if (response.isSuccessful && response.body != null) {
      value = SuccessChatConnectionState(value, response.body!);
    } else {
      value = value.copyWith(isLoading: false);
    }
    value = ErrorChatConnectionState(value, response.error as ApiError);
  }
}
