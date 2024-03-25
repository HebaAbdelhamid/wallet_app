import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://walletapp-cr96.onrender.com/api/',
        headers: {
          'Content-Type': 'application/json',
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'En',
    String? token,
  }) async {
    if (dio.interceptors.isEmpty) {
      init();
    }


    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };

    return dio.post(
      url,
      data: data,
    );
  }
}
/*import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  static init (){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {
          'Content-Type' : 'application/json',
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future <Response> postData ({required String url, required Map<String , dynamic> data, String lang = 'En', String ? token,
}) async {
    dio.options.headers ={
      'lang' : lang,
      'Authorization':token,
    };
    return dio.post(
        url,
        data: data,
    );
  }
}*/