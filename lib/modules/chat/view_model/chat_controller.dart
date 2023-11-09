import 'package:enif/models/chat_session.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:enif/modules/chat/data/dto/sent_chat_dto.dart';
import 'package:enif/modules/chat/repository/chat_repository.dart';
import 'package:enif/socket/socket_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ChatController extends ValueNotifier<ChatState> {
  final ChatSession session;
  final SocketRepository socketRepository;

  ChatController(this.session)
      : socketRepository = SocketRepository(),
        super(ChatState()) {
    load();
    socketRepository.connectSocket(
        session.id ?? '', [(eventName: 'responseMessage', handler: onMessage)]);
  }
  final _repository = ChatRepository();

  onMessage(dynamic data) {
    try {
      if(kDebugMode){
        print('socket::  $data');
      }
      var message = (data['message'] as List)
          .map((d) => Message.fromJson(d))
          .where((element) => element.role == 'assistance')
          .firstOrNull;
      if(kDebugMode){
        print('socket::  $message');
      }

      if (message != null && data['replyMode'] == 'auto') {
        var messageExists =
            value.messages?.any((e) => e.id == message.id) ?? false;
        var messages = messageExists
            ? value.messages?.map((e) => e.id == message.id ? message : e)
            : [...?value.messages, message];
        // messages.re
        if(kDebugMode)
        {
          print('socket:: $message');
        }
        // messages.sort
        value = value.copyWith(isLoading: false, messages: messages?.toList());
      }
    } catch (error) {
      if (kDebugMode) {
        print('socket:: error $error');
        print(error);
      }
    }
  }

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
          createdAt: DateTime.now(),
          id: sid)
    ]);
    Future.delayed(const Duration(milliseconds: 500), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    var response =
        await _repository.sendChat(SendChatDto(session, value.text ?? ''));

    if (response.isSuccessful && response.body != null) {
      var body = response.body!;
      if (body.replyMode == 'auto') {
        var messages =
            value.messages?.where((element) => (element.id != sid)).toList();
        value = value.copyWith(
            isLoading: false, messages: [...?messages, ...?body.message]);
      }
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
        session.email ?? '', session.businessId ?? '', session.id ?? '');

    if (response.isSuccessful && response.body != null) {
      var body = response.body!;

      value = value.copyWith(isLoading: false, messages: body);
      Future.delayed(const Duration(milliseconds: 500), () {
        if (scrollController.hasClients) {
          scrollController.animateTo(scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate);
        }
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