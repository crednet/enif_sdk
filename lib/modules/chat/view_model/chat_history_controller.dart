import 'package:enif/enif.dart';
import 'package:enif/models/chat_session.dart';
import 'package:enif/models/ticket_status.dart';
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
      for (var ticket in body) {
        var ticketResponse = await _repository.ticketStatus(ticket.id ?? '');

        if (ticketResponse.isSuccessful) {
          var statusBody = ticketResponse.body;
          var updatedTicketStatus =
              TicketStatus(ticketid: ticket.id, isRead: statusBody ?? true);
          var statusExists =
              value.ticketStatus?.any((e) => e.ticketid == ticket.id) ?? false;
          var ticketStatusList = statusExists
              ? value.ticketStatus?.map(
                  (e) => e.ticketid == ticket.id ? updatedTicketStatus : e)
              : [...?value.ticketStatus, updatedTicketStatus];

          value = value.copyWith(ticketStatus: ticketStatusList?.toList());
        } else {
          if (kDebugMode) {
            print('ticketResponse:::::::$ticketResponse');
          }
        }
      }
    } else {
      value = value.copyWith(isLoading: false);
    }
  }

  Future updateUnreadMessages(String ticketId) async {
    // int index = value.ticketStatus
    //         ?.indexWhere((status) => status.ticketid == ticketId) ??
    //     -1;

    // if (index != -1) {
    // value.ticketStatus?[index] =
    //     TicketStatus(ticketid: ticketId, isRead: isRead);
    var updateTicketResponse = await _repository.updateTicketStatus(ticketId);

    if (updateTicketResponse.isSuccessful) {
      var statusBody = updateTicketResponse.body;
      var updatedTicketStatus =
          TicketStatus(ticketid: ticketId, isRead: statusBody ?? true);
      if (kDebugMode) {
        print('statuss::::: $statusBody');
      }
      var statusExists =
          value.ticketStatus?.any((e) => e.ticketid == ticketId) ?? false;
      var ticketStatusList = statusExists
          ? value.ticketStatus
              ?.map((e) => e.ticketid == ticketId ? updatedTicketStatus : e)
          : [...?value.ticketStatus, updatedTicketStatus];

      value = value.copyWith(ticketStatus: ticketStatusList?.toList());
    } else {
      if (kDebugMode) {
        print('updateTicketResponse:::::::$updateTicketResponse');
      }
    }
    // }
  }
}

class ChatHistoryState extends Object {
  final bool isLoading, isRead;
  final String? text;
  List<TicketStatus>? ticketStatus;
  final List<ChatSession>? messages;

  int get length => messages?.length ?? 0;
  int get statusLength => ticketStatus?.length ?? 0;

  ChatHistoryState({
    this.text,
    this.isLoading = false,
    this.isRead = true,
    this.ticketStatus,
    this.messages,
  });

  ChatHistoryState copyWith(
          {bool? isLoading,
          bool? isRead,
          String? text,
          List<TicketStatus>? ticketStatus,
          List<ChatSession>? messages}) =>
      ChatHistoryState(
          isLoading: isLoading ?? false,
          isRead: isRead ?? true,
          text: text ?? this.text,
          ticketStatus: ticketStatus ?? this.ticketStatus,
          messages: messages ?? this.messages);

  @override
  bool operator ==(Object other) {
    return (other is ChatHistoryState &&
        other.runtimeType == runtimeType &&
        other.isLoading == isLoading &&
        other.isRead == isRead &&
        other.text == text &&
        listEquals<TicketStatus>(other.ticketStatus, ticketStatus) &&
        listEquals<ChatSession>(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(isLoading, isRead, text);
}
