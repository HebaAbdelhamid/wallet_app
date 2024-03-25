import 'package:dio/dio.dart';
import 'package:wallet_app/data/model/getcateory.dart';

import 'dioConfig.dart';

class ApiDioServises {
  ApiDioServises._();

  static final ApiDioServises api = ApiDioServises._();

  Future<Category> fetchNewsData(String category, String authToken) async {
    Dio dio = DioConfig.getDio(authToken);
    String url = "user/allCategories";
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      return Category.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
