import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/get_user_chat_model.dart';
import '../service/api_provider.dart';

class GetUserChatEvent {}

class GetUserChatRefreshEvent extends GetUserChatEvent {
  String? email;
  GetUserChatRefreshEvent({this.email});
}

class GetUserChatState {}

class GetUserChatInitialState extends GetUserChatState {}

class GetUserChatLoadingState extends GetUserChatState {}

class GetUserChatSuccessState extends GetUserChatState {
  List<GetUserChatModel>? data;
  GetUserChatSuccessState(this.data);
}


class GetUserChatErrorState extends GetUserChatState {
  String errorMessage;
  GetUserChatErrorState(this.errorMessage);
}

class GetUserChatBloc extends Bloc<GetUserChatEvent, GetUserChatState> {
  ApiProvider provider = ApiProvider();
  GetUserChatBloc(this.provider) : super(GetUserChatInitialState()) {
    on<GetUserChatRefreshEvent>((event, emit) async {
      await provider.getUserChatAPI(event, emit);
    });
  }
}