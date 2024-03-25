/*import 'package:dio/dio.dart';


class DioConfig{
  static Dio getDio(String authToken) {

    BaseOptions options = BaseOptions(
      baseUrl: 'https://walletapp-cr96.onrender.com/api/v1/',
      headers: {'Authorization': 'Bearer $authToken'}, // Include the token in the headers
    );

    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(requestBody: true));
    return dio;
  }
}*/
import 'package:dio/dio.dart';


class DioConfig{
  static Dio getDio(String authToken) {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://walletapp-cr96.onrender.com/api/v1/',
      headers: {'Authorization': 'Bearer $authToken'}, // Include the token in the headers
    );

    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(requestBody: true));
    return dio;
  }
}

