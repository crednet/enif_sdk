// import 'package:enif/models/send_chat_model.dart';
// import 'package:enif/socket/socket_repository.dart';
// import 'package:flutter/material.dart';

// class ChatSocketViewModel extends ChangeNotifier {
//   List<Message> messages = [];
//   chatListeners() {
//     getRoomDetailsOn();
//   }

//   addMessage(Message value) {
//     messages.add(value);
//     notifyListeners();
//   }

//   getRoomDetailsOn() {
//     SocketRepository.socket!.stream.listen(
//       (data) {
//         debugPrint('get-chat-rooms==${data.runtimeType}, ${data['message']}');
//         messages.insert(0, Message.fromJson(data['message'][0]));
//         notifyListeners();
//         messages.insert(0, Message.fromJson(data['reply']));
//         notifyListeners();
//         debugPrint('messages==$messages');
//       },
//       onDone: () {
//         (data) => debugPrint('ChatSocketManager disconnecting==$data');
//       },
//       onError: (error) {
//         (data) => debugPrint('ChatSocketManager Error==$data');
//       },
//     );
//   }
// }
