import 'package:enif/enif.dart';
import 'package:enif/models/faq.dart';
import 'package:flutter/foundation.dart';

class FaqState extends Object {
  final bool isLoading;
  final List<Faq>? faqs;

  FaqState({this.isLoading = false, this.faqs});

  FaqState copyWith({bool? isLoading, final List<Faq>? faqs}) => FaqState(
        isLoading: isLoading ?? false,
        faqs: faqs ?? this.faqs,
      );

  @override
  bool operator ==(Object other) {
    return (other is FaqState &&
        other.runtimeType == runtimeType &&
        other.isLoading == isLoading &&
        listEquals<Faq>(other.faqs, faqs));
  }

  @override
  int get hashCode => Object.hash(isLoading, faqs?.toString());
}

class FaqViewModel extends ValueNotifier<FaqState> {
  final _repository = FaqRepository();

  FaqViewModel() : super(FaqState());
  String searchText = '';

  search(String text) {
    searchText = text.toLowerCase();
    notifyListeners();
  }

  Future<void> getFaqs() async {
    if (EnifController.businessId == null) {
      throw Exception(
          'BusinessId is must be set, please call "EnifController.setBusinessId("")" before calling this method');
    }
    value = value.copyWith(isLoading: true);
    var response = await _repository.getFaqs(true); // fetch from cache

    if (response.isSuccessful) {
      value = value.copyWith(isLoading: true, faqs: response.body);
    }

    response = await _repository.getFaqs(false);

    if (response.isSuccessful) {
      value = value.copyWith(faqs: response.body);
    }
    value = value.copyWith(isLoading: false);
  }
}
