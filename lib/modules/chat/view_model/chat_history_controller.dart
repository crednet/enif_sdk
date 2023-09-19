import 'package:enif/enif.dart';
import 'package:enif/models/chat_session.dart';
import 'package:flutter/foundation.dart';

class ChatHistoryController extends ValueNotifier<ChatHistoryState> {
  ChatHistoryController() : super(ChatHistoryState()) {
    load();
  }
  final _repository = ChatRepository();

  Future load() async {
    var response = await _repository.getChatHistory(
        EnifController().userParams.value?.email ?? '',
        EnifController.businessId ?? '');

    if (response.isSuccessful && response.body != null) {
      var body = response.body!;

      value = value.copyWith(isLoading: false, messages: body);
    } else {
      value = value.copyWith(isLoading: false);
    }
  }
}

class ChatHistoryState extends Object {
  final bool isLoading;
  final String? text;
  final List<ChatSession>? messages;

  int get length => messages?.length ?? 0;

  ChatHistoryState({
    this.text,
    this.isLoading = false,
    this.messages,
  });

  ChatHistoryState copyWith(
          {bool? isLoading, String? text, List<ChatSession>? messages}) =>
      ChatHistoryState(
          isLoading: isLoading ?? false,
          text: text ?? this.text,
          messages: messages ?? this.messages);

  @override
  bool operator ==(Object other) {
    return (other is ChatHistoryState &&
        other.runtimeType == runtimeType &&
        other.isLoading == isLoading &&
        other.text == text &&
        listEquals<ChatSession>(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(isLoading, text);
}
