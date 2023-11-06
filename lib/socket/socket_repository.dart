import 'dart:io';

import 'package:enif/constants/api_urls.dart';
import 'package:enif/models/send_chat_model.dart';
import 'package:flutter/foundation.dart';

enum SocketReadyState {
  connecting(0),
  open(1),
  closing(2),
  closed(3);

  final int state;

  const SocketReadyState(this.state);
}

class SocketRepository {
  WebSocket? _socket;

  // SocketRepository() {
  //  _socket = IOWebSocketChannel.connect(
  //   ApiUrls.socketURL,
  //   headers: {'Authorization': ticketId},
  //   pingInterval: const Duration(seconds: 10),
  //   // connectTimeout: const Duration(minutes: 2),
  // );
  // }

  SocketReadyState get state => SocketReadyState.values.firstWhere(
      (element) => _socket?.readyState == element.state,
      orElse: () => SocketReadyState.connecting);

  bool get isConnected => state == SocketReadyState.open;

  connectSocket(String ticketId, Function(Message) onMessage) {
    debugPrint('ChatSocketManager connected');
    // (dat) => debugPrint('ChatSocketManager onConnecting====$data');
    // onConnect();
    WebSocket.connect(
      ApiUrls.socketURL,
      headers: {'Authorization': ticketId},
      // protocols: protocols,
      // customClient: customClient,
    ).then((value) {
      _socket = value;
      if (kDebugMode) {
        print('connected:: $value');
      }
      _socket?.listen((event) {
        if (kDebugMode) {
          print(event);
        }
      });
    }).catchError((e, _) {
      Future.delayed(
          const Duration(seconds: 1), () => connectSocket(ticketId, onMessage));
    });
  }

  socketDisconnect() {
    if (_socket != null && isConnected) {
      _socket?.close();
      debugPrint("ChatSocketManager onDisconnected");
    }
  }
}
