import 'package:data_repository/data_repository.dart';
import 'package:enif/constants/api_urls.dart';
import 'package:enif/data/remote/interceptor/json_interceptor.dart';
import 'package:enif/models/faq.dart';
import 'package:enif/models/models.dart';

import '../../models/enif_error.dart';

class EnifApi {
  String get baseUrl => "https://enif-business-production.up.railway.app";

  ApiRequest<List<Faq>, Faq> getFaqs(String businessId) {
    return ApiRequest<List<Faq>, Faq>(
        baseUrl: baseUrl,
        path: ApiUrls.faq(businessId),
        method: ApiMethods.get,
        dataKey: '',
        error: ErrorDescription(),
        interceptors: [
          HeaderInterceptor({
            "Content-Type": "application/json",
            "Accept": "application/json",
          }),
          JsonInterceptor<EnifError>(Models.factories),
        ]);
  }
}
