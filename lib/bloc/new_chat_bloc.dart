// import 'package:enif/models/chat_session.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../service/api_provider.dart';

// class NewChatEvent {}

// class NewChatRefreshEvent extends NewChatEvent {
//   String? businessId;
//   String? channel;
//   String? customer;
//   String? phoneNo;
//   String? email;
//   NewChatRefreshEvent(
//       {this.customer, this.channel, this.businessId, this.email, this.phoneNo});
// }

// class NewChatFilterEvent extends NewChatEvent {
//   NewChatFilterEvent();
// }

// class NewChatState {}

// class NewChatInitialState extends NewChatState {}

// class NewChatLoadingState extends NewChatState {}

// class NewChatSuccessState extends NewChatState {
//   ChatSession data;
//   NewChatSuccessState(this.data);
// }

// class NewChatErrorState extends NewChatState {
//   String errorMessage;
//   NewChatErrorState(this.errorMessage);
// }

// class NewChatBloc extends Bloc<NewChatEvent, NewChatState> {
//   ApiProvider provider = ApiProvider();
//   NewChatBloc(this.provider) : super(NewChatInitialState()) {
//     on<NewChatRefreshEvent>((event, emit) async {
//       await provider.newChatAPI(event, emit);
//     });
//   }
// }
