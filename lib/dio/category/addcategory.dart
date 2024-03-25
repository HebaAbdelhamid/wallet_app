import 'package:dio/dio.dart';
import 'package:wallet_app/data/model/addcategorymodel.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

class AddCategory {

  void postCategory(String categoryName) async {
    Dio dio = Dio();
    var apitoken = CacheHelper.getData(key: 'tokenn');

    addcategory newCategory = addcategory(
      addedcategory: Addedcategory(categoryName: categoryName),
    );

    Map<String, dynamic> jsonData = newCategory.toJson();

    try {
      Map<String, dynamic> data = {
        'categoryName':categoryName
      };
      Response response = await dio.post(
        'https://walletapp-cr96.onrender.com/api/v1/category/addCategory',
        data: data,
        options: Options(headers: {
          'Authorization': 'Bearer $apitoken',
        }),
      );

      // Handling response
      if (response.statusCode == 200) {
        print('==============add  $apitoken');
        print('Category posted successfully ');
        print(response.data.toString());
      } else {
        print('Failed to post category');
      }
    } catch (e) {
      print('Error posting category: $e');
    }
  }

}
/*Future<void> postData(String title) async {
    var apitoken=CacheHelper.getData(key: 'token');

    try {
      // Define the data to be sent in the request body
      Map<String, dynamic> data = {
        "categoryName": "categoryName"

      };

      // Send a POST request with the data to the specified URL
      Response response = await _dio.post(
        'https://walletapp-cr96.onrender.com/api/v1/category/addCategory/$apitoken',
        data: data,
      );

      if (response.statusCode == 201) {
        // If the request is successful (status code 201), do something
        print('Data created successfully');
      } else {
        // If the request is not successful, throw an exception
        throw Exception('Failed to create data');
      }
    } catch (e) {
      // If an error occurs during the request, throw an exception
      throw Exception('Failed to create data: $e');
    }
  }
}*/
