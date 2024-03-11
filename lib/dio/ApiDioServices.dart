import 'package:dio/dio.dart' ;
import 'package:wallet_app/data/model/categoryModel.dart';
import 'dioConfig.dart';
class ApiDioServises {
  ApiDioServises._();

  static final ApiDioServises api = ApiDioServises._();

  Future<Category_> fetchNewsData(String category, String authToken) async {
    Dio dio = DioConfig.getDio(authToken);
    String url = "user/allCategories";
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      return Category_.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}


 /* Future<NewsResponse>SearchData(String data)async{
    Dio dio=DioConfig.getDio();
    String url="everything";
    Response response=await dio.get(url,queryParameters: {'q':data,'apikey':apiKey});
    if(response.statusCode==200){
      return NewsResponse.fromJson(response.data);
    }else{
      throw DioException(requestOptions: RequestOptions(baseUrl: baseUrl));
    }
  }
}*/
