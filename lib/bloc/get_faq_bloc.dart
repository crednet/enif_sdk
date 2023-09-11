// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../models/faq.dart';
// import '../service/api_provider.dart';

// class GetFaqEvent {}

// class GetFaqRefreshEvent extends GetFaqEvent {
//   GetFaqRefreshEvent();
// }

// class GetFaqState {}

// class GetFaqInitialState extends GetFaqState {}

// class GetFaqLoadingState extends GetFaqState {}

// class GetFaqSuccessState extends GetFaqState {
//   List<GetFaqsModel>? data;
//   GetFaqSuccessState(this.data);
// }


// class GetFaqErrorState extends GetFaqState {
//   String errorMessage;
//   GetFaqErrorState(this.errorMessage);
// }

// class GetFaqBloc extends Bloc<GetFaqEvent, GetFaqState> {
//   ApiProvider provider = ApiProvider();
//   GetFaqBloc(this.provider) : super(GetFaqInitialState()) {
//     on<GetFaqRefreshEvent>((event, emit) async {
//       await provider.getFaqAPI(event, emit);
//     });
//   }
// }