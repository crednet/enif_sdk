import 'dart:convert';
import 'dart:io';

import 'package:enif/constants/api_urls.dart';
import 'package:flutter/foundation.dart';

typedef EventHandler = ({String eventName, dynamic Function(dynamic) handler});

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

  SocketReadyState get state => SocketReadyState.values.firstWhere(
      (element) => _socket?.readyState == element.state,
      orElse: () => SocketReadyState.connecting);

  bool get isConnected => state == SocketReadyState.open;

  connectSocket(String ticketId, List<EventHandler> handlers) {
    if (kDebugMode) {
      print('ChatSocketManager connected');
    }
    WebSocket.connect(
      ApiUrls.socketURL,
      protocols: [ticketId],
    ).then((value) {
      _socket = value;
      if (kDebugMode) {
        print('socket:: ${value.readyState}, ${value.pingInterval}');
      }
      _socket?.listen((e) {
        if (kDebugMode) {
          print('socket:: ${e.runtimeType}');
        }
        var response = jsonDecode(e);
        var event = response['event'];
        var data = response['data'];
        if (kDebugMode) {
          print('socket:: ${data.runtimeType}, $event');
        }
        for (var element in handlers) {
          if (kDebugMode) {
            print('socket::  ${element.eventName == event}');
          }
          if (element.eventName == event) {
            element.handler(data);
          }
        }
      });
    }).catchError((e, _) {
      Future.delayed(
          const Duration(seconds: 1), () => connectSocket(ticketId, handlers));
    });
  }

  socketDisconnect() {
    if (_socket != null && isConnected) {
      _socket?.close();
      debugPrint("ChatSocketManager onDisconnected");
    }
  }
}
