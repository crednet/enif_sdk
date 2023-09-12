import 'package:data_repository/data_repository.dart';
import 'package:enif/data/remote/enif_api.dart';
import 'package:enif/models/faq.dart';
import 'package:enif/modules/chat/view_model/enif_controller.dart';

import '../../../data/local/shared_preference_repository.dart';

class FaqRepository extends DataRepository {
  final _api = EnifApi();

  FaqRepository()
      : super(SharedPreferenceRepository(),
            RemoteRepository(HttpApiProvider(), 'An error occured'));

  Future<ApiResponse<List<Faq>, Faq>> getFaqs(bool forceCache) {
    return handleRequest(_api.getFaqs(EnifController.businessId ?? ''),
        cache: CacheDescription(
            'FaqRepository-getFaqs-${EnifController.businessId ?? ''}'
                .toLowerCase(),
            overrideTime: forceCache,
            lifeSpan: CacheDescription.oneHour));
  }
}
