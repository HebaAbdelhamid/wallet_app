import 'package:dio/dio.dart';
import 'package:wallet_app/data/model/getcateory.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

/*Future<List<UserCategories>> getCategoryList() async {
  Dio dio = Dio();
  var apitoken=CacheHelper.getData(key: 'token');

  try {
    Response response = await dio.get('https://walletapp-cr96.onrender.com/api/v1/user/allCategories',options: Options(
      headers: {
        'Authorization': 'Bearer $apitoken', // Include token in headers
        // Add any other headers if required
      },
    ),);

    if (response.statusCode == 200) {
      List<UserCategories> categories = (response.data['userCategories'] as List)
          .map((categoryJson) => UserCategories.fromJson(categoryJson))
          .toList();
      print('=============get');
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}*/
/*Future<List<UserCategories>> getCategoryList() async {
  Dio dio = Dio();
  var apitoken = CacheHelper.getData(key: 'token');
  var token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc0xvZ2luIjp0cnVlLCJpZCI6IjY1ZTc3ZGZjMWM0YTE1YWU3YzIwNTZkNiIsImlhdCI6MTcwOTk4OTEwMX0._6dXLLWbrHw9cXGUSqmcgPf16zL5BX1p5K7Ej4EEV54';

  try {
    Response response = await dio.get(
      'https://walletapp-cr96.onrender.com/api/v1/user/allCategories',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // Include token in headers
          // Add any other headers if required
        },
      ),
    );

    if (response.statusCode == 200) {
      // Check if response data is not null
      if (response.data != null && response.data['userCategories'] != null) {
        List<UserCategories> categories = (response.data['userCategories'] as List)
            .map((categoryJson) => UserCategories.fromJson(categoryJson))
            .toList();
        return categories;
      } else {
        // If response data or userCategories is null, return an empty list
        return [];
      }
    } else {
      throw Exception('Failed to load categories');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}*/
/*void fetchData() async {
  // Get the token from your cache
  var apitoken = CacheHelper.getData(key: 'token');
  var token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc0xvZ2luIjp0cnVlLCJpZCI6IjY1ZTc3ZGZjMWM0YTE1YWU3YzIwNTZkNiIsImlhdCI6MTcwOTk4OTEwMX0._6dXLLWbrHw9cXGUSqmcgPf16zL5BX1p5K7Ej4EEV54';

  Dio dio = Dio(BaseOptions(
    baseUrl: 'https://walletapp-cr96.onrender.com/api/v1/',
    headers: {
      'Authorization': 'Bearer $token',
    },
  ));

  try {
    // Make a GET request to your API endpoint
    Response response = await dio.get('user/allCategories');

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      // Parse the JSON response using the getcategory.fromJson method
      getcategory data = getcategory.fromJson(response.data);

      // Access the userCategories list and loop through it
      if (data.userCategories != null) {
        for (UserCategories category in data.userCategories!) {
          // Access the categoryName property of each UserCategories object
          String? categoryName = category.categoryName;
          if (categoryName != null) {
            print('Category Name: $categoryName');
          }
        }
      }
    } else {
      // Handle other status codes if needed
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
  }
}*/

// Call the fetchData function to fetch the data
