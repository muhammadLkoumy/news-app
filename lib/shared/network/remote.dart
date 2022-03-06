import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static inti() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required dynamic map,
  }) async {
    return await dio.get(
      url,
      queryParameters: map,
    );
  }
}
