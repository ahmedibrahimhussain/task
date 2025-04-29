
import 'package:dio/dio.dart';

import 'api_constants.dart';

class ApiService {
  late Dio dio;
  Map<String, dynamic>? headers;

  ApiService({this.headers}) {
    Map<String, dynamic> commonHeaders = {};
    if (headers != null) {
      commonHeaders.addAll(headers!);
    }
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: commonHeaders,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),

    );
    dio = Dio(baseOptions);
  }
}
