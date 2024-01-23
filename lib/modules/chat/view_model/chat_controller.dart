import 'dart:io';
import 'package:enif/models/chat_session.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:enif/modules/chat/data/dto/sent_chat_dto.dart';
import 'package:enif/modules/chat/repository/chat_repository.dart';
import 'package:enif/modules/chat/view_model/enif_controller.dart';
import 'package:enif/socket/socket_repository.dart'
    if (dart.library.html) 'package:enif/socket/socket_repository_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import 'chat_history_controller.dart';

class ChatController extends ValueNotifier<ChatState> {
  final ChatSession session;
  final SocketRepository socketRepository;

  ChatController(this.session)
      : socketRepository = SocketRepository(),
        super(ChatState()) {
    load();
    socketRepository.connectSocket(session.id ?? '', [
      (eventName: 'responseMessage', handler: onMessage),
      (eventName: 'newmessage', handler: manualMessage),
      (eventName: 'businessTyping', handler: onBusinessTyping),
    ]);
  }
  final _repository = ChatRepository();

  onBusinessTyping(dynamic data) {
    try {
      if (kDebugMode) {
        print('socket:: isBusinessTyping  $data');
      }

      if (data['businessId'] == session.businessId &&
          data['ticketId'] == session.id) {
        // messages.sort
        value = value.copyWith(
          isBusinessTyping: data['typing'],
        );
      }
    } catch (error) {
      if (kDebugMode) {
        print('socket:: error $error');
        print(error);
      }
    }
  }

  manualMessage(dynamic data) {
    try {
      if (kDebugMode) {
        print('socket:: data  $data');
      }
      var message = Message.fromJson(data['reply']);
      if (kDebugMode) {
        print('socket:: message  $message');
        print('socket:: messageId  ${message.id}');
      }

      if (data['ticketId'] == session.id) {
        var messageExists =
            value.messages?.any((e) => e.id == message.id) ?? false;
        var messages = messageExists
            ? value.messages?.map((e) => e.id == message.id ? message : e)
            : [...?value.messages, message];

        ChatHistoryController().updateUnreadMessages(session.id ?? '');
        // messages.re
        if (kDebugMode) {
          print('socket:: supervisedMessage $message');
        }
        // messages.sort
        value = value.copyWith(isLoading: false, messages: messages?.toList());
        Future.delayed(const Duration(milliseconds: 500), () {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('socket:: error $error');
        print(error);
      }
    }
  }

  onMessage(dynamic data) {
    try {
      if (kDebugMode) {
        print('socket:: data  $data');
      }
      var message = (data['message'] as List)
          .map((d) => Message.fromJson(d))
          .where((element) => element.role == 'assistance')
          .firstOrNull;
      if (kDebugMode) {
        print('socket:: message  $message');
        print('socket:: messageId  ${message?.id}');
      }

      if (message != null && data['replyMode'] == 'auto') {
        var messageExists =
            value.messages?.any((e) => e.id == message.id) ?? false;
        var messages = messageExists
            ? value.messages?.map((e) => e.id == message.id ? message : e)
            : [...?value.messages, message];
        // messages.re
        if (kDebugMode) {
          for (Message item in messages!) {
            print('socket:: ${item.id}');
          }
        }
        // messages.sort
        value = value.copyWith(isLoading: false, messages: messages?.toList());
        Future.delayed(const Duration(milliseconds: 500), () {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('socket:: error $error');
        print(error);
      }
    }
  }

  List<File?> selectedImages = [];
  XFile? returnImage;
  String get baseUrl => EnifController().env.baseUrl;
  // dynamic _pickImageError;

  Future handleImageUpload() async {
    value = value.copyWith(isImageLoading: true, imageUrls: []);
    List<String> imageBytesList = [];
    for (var selectedImage in selectedImages) {
      var imageBytes = selectedImage?.path;
      imageBytesList.add(imageBytes ?? '');
    }
    dynamic responseList = await _repository.uploadImages(
        imageBytesList, EnifController.businessId ?? '');

    value = value.copyWith(isImageLoading: false, imageUrls: [...responseList]);
    if (kDebugMode) {
      print('Uploaded images: ${value.imageUrls}');
    }
  }

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  textChanged(String text) {
    value = value.copyWith(text: text);
  }

  Future send() async {
    // print('my images :::: ${value.imageUrls}');
    final sid = UniqueKey().toString();
    textEditingController.clear();
    selectedImages.clear();

    value = value.copyWith(isLoading: true, messages: [
      ...?value.messages,
      Message(
          content: (value.imageUrls ?? []).isNotEmpty
              ? '${value.text?.trim() ?? ''}\n${value.imageUrls?.map((url) => '($url)\n').join(' ')}'
              : value.text?.trim() ?? '',
          status: 'sent',
          role: "user",
          createdAt: DateTime.now(),
          id: sid)
    ]);
    Future.delayed(const Duration(milliseconds: 500), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    var response = await _repository.sendChat(SendChatDto(
      session,
      (value.imageUrls ?? []).isNotEmpty
          ? '${value.text?.trim() ?? ''}\n${value.imageUrls?.map((url) => '($url)\n').join(' ')}'
          : value.text?.trim() ?? '',
    ));
    value = value.copyWith(imageUrls: [], text: '');
    if (response.isSuccessful && response.body != null) {
      var body = response.body!;
      if (body.replyMode == 'auto') {
        var messages =
            //  value.messages?.where((element) => (element.id != sid)).toList() ??
            //         [];
            value.messages
                ?.where((element) =>
                    (element.id != sid && element.id != body.reply?.id))
                .toList();
        // var messages =
        //     value.messages?.where((element) => (element.id != sid)).toList() ??
        //         [];
        // var responseExists =
        //     value.messages?.any((e) => e.id == body.message?[1].id) ?? false;
        // var response = responseExists
        //     ? value.messages?.map((e) => e.id == body.message?[1].id ? body.message : e)
        //     : [...?value.messages, body.message];

        value = value.copyWith(
            isLoading: false, messages: [...?messages, ...?body.message]);
        // value = value.copyWith(isLoading: false, messages: messages);
        // for (var item in [...?body.message]) {
        //   // if(!messages.any((element) => element.id == item.id)){
        //   //   messages.add(item);
        //   // }
        //   int existingMessageIndex =
        //       value.messages?.indexWhere((element) => element.id == item.id) ??
        //           -1;

        //   if (existingMessageIndex != -1) {
        //     value.messages?.removeAt(existingMessageIndex);
        //     value.messages?.insert(existingMessageIndex, item);
        //   } else {
        //     value.messages?.add(item);
        //   }
        // }
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

  @override
  void dispose() {
    socketRepository.socketDisconnect();
    super.dispose();
  }
}

class ChatState extends Object {
  final bool isLoading, isBusinessTyping, isImageLoading;
  final String? text;
  final List<Message>? messages;
  final List<String>? imageUrls;

  ChatState(
      {this.text,
      this.isLoading = false,
      this.isImageLoading = false,
      this.isBusinessTyping = false,
      this.messages,
      this.imageUrls});

  ChatState copyWith(
          {bool? isLoading,
          bool? isImageLoading,
          bool? isBusinessTyping,
          String? text,
          List<Message>? messages,
          List<String>? imageUrls}) =>
      ChatState(
          isLoading: isLoading ?? false,
          isImageLoading: isImageLoading ?? false,
          isBusinessTyping: isBusinessTyping ?? false,
          text: text ?? this.text,
          messages: messages ?? this.messages,
          imageUrls: imageUrls ?? this.imageUrls);

  @override
  bool operator ==(Object other) {
    return (other is ChatState &&
        other.runtimeType == runtimeType &&
        other.isLoading == isLoading &&
        other.isImageLoading == isImageLoading &&
        other.isBusinessTyping == isBusinessTyping &&
        other.text == text &&
        listEquals<Message>(other.messages, messages) &&
        listEquals<String>(other.imageUrls, imageUrls));
  }

  @override
  int get hashCode =>
      Object.hash(isLoading, isImageLoading, isBusinessTyping, imageUrls, text);
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
