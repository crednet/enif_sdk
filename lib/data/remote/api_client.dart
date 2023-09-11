import 'package:data_repository/data_repository.dart';

class ApiClient {
  static ApiRequest<ResponseType, InnerType>
      baseRequest<ResponseType, InnerType>(String baseUrl,
              {String? requestId}) =>
          ApiRequest<ResponseType, InnerType>(
            baseUrl: baseUrl,
            requestId: requestId,
            dataKey: 'data',
            interceptors: [
              HeaderInterceptor({
                "Content-Type": "application/json",
                "Accept": "application/json",
              }),
              // NetworkDurationInterceptor(),
            ],
          );
}
