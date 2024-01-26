import 'package:dio/dio.dart';

class DioHelper {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    ),
  );

  Future<Response?> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
