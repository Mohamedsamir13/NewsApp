import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://newsapi.org/v2/",
      receiveDataWhenStatusError: true,
    );
    dio = Dio(
      baseOptions,
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> parameters,
  }) async {
    return await dio.get(
      url,
      queryParameters: parameters,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      url,
      data: data,
    );
  }
}