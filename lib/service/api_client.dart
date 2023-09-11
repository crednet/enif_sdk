import 'package:dio/dio.dart';

class ApiClient{
  static Future<Dio> dioClient() async {
    Dio dio = Dio();
    BaseOptions options = BaseOptions(
      baseUrl: "https://enif-business-production.up.railway.app/",
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 50),
      followRedirects: true,
      validateStatus: (status) {
        return status! <= 500;
      },
    );
    dio = Dio(options);
    return dio;
  }
}