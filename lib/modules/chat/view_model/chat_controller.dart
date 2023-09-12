import 'package:enif/models/chat_session.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:enif/modules/chat/data/dto/sent_chat_dto.dart';
import 'package:enif/modules/chat/repository/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ChatController extends ValueNotifier<ChatState> {
  final ChatSession session;

  ChatController(this.session) : super(ChatState()) {
    load();
  }
  final _repository = ChatRepository();

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  textChanged(String text) {
    value = value.copyWith(text: text);
  }

  Future send() async {
    final sid = UniqueKey().toString();
    textEditingController.clear();

    value = value.copyWith(isLoading: true, messages: [
      ...?value.messages,
      Message(
          content: value.text ?? '',
          status: 'sent',
          role: "user",
          createdDate: DateTime.now().toIso8601String(),
          sId: sid)
    ]);
    Future.delayed(const Duration(milliseconds: 500), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    var response =
        await _repository.sendChat(SendChatDto(session, value.text ?? ''));

    if (response.isSuccessful && response.body != null) {
      var body = response.body!;
      var messages = value.messages
          ?.map((element) => (element.sId == sid ? body.message! : element))
          .toList();

      value = value
          .copyWith(isLoading: false, messages: [...?messages, body.reply!]);
      Future.delayed(const Duration(milliseconds: 500), () {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate);
      });
    } else {
      value = value.copyWith(isLoading: false);
    }
  }

  Future load() async {
    var response = await _repository.getChatMessages(
        session.email ?? '', session.businessId ?? '', session.chatId ?? '');

    if (response.isSuccessful && response.body != null) {
      var body = response.body!;

      value = value.copyWith(isLoading: false, messages: body);
      Future.delayed(const Duration(milliseconds: 500), () {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate);
      });
    } else {
      value = value.copyWith(isLoading: false);
    }
  }
}

class ChatState extends Object {
  final bool isLoading;
  final String? text;
  final List<Message>? messages;

  ChatState({
    this.text,
    this.isLoading = false,
    this.messages,
  });

  ChatState copyWith(
          {bool? isLoading, String? text, List<Message>? messages}) =>
      ChatState(
          isLoading: isLoading ?? false,
          text: text ?? this.text,
          messages: messages ?? this.messages);

  @override
  bool operator ==(Object other) {
    return (other is ChatState &&
        other.runtimeType == runtimeType &&
        other.isLoading == isLoading &&
        other.text == text &&
        listEquals<Message>(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(isLoading, text);
}

// class SuccessChatState extends ChatState {
//   final ChatSession chatSession;
//   SuccessChatState(ChatState state, this.chatSession)
//       : super(
//             isLoading: false,
//             name: state.name,
//             phoneNo: state.phoneNo,
//             email: state.email);
// }

// class ErrorChatState extends ChatState {
//   final ApiError error;
//   ErrorChatState(ChatState state, this.error)
//       : super(
//             isLoading: false,
//             name: state.name,
//             phoneNo: state.phoneNo,
//             email: state.email);
// }
