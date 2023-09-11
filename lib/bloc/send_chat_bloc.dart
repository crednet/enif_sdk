import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/send_chat_model.dart';
import '../service/api_provider.dart';

class SendChatEvent {}

class SendChatRefreshEvent extends SendChatEvent {
  String? chatId;
  String? businessId;
  String? channel;
  String? customer;
  String? promptMsg;
  SendChatRefreshEvent({this.customer, this.channel, this.businessId, this.promptMsg, this.chatId});
}

class SendChatState {}

class SendChatInitialState extends SendChatState {}

class SendChatLoadingState extends SendChatState {}

class SendChatSuccessState extends SendChatState {
  SendChatModel data;
  SendChatSuccessState(this.data);
}


class SendChatErrorState extends SendChatState {
  String errorMessage;
  SendChatErrorState(this.errorMessage);
}

class SendChatBloc extends Bloc<SendChatEvent, SendChatState> {
  ApiProvider provider = ApiProvider();
  SendChatBloc(this.provider) : super(SendChatInitialState()) {
    on<SendChatRefreshEvent>((event, emit) async {
      await provider.sendChatAPI(event, emit);
    });
  }
}