import 'package:dio/dio.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

class AddIncome {
  final Dio _dio = Dio();

  Future<void> postData(String title, int cost) async {
    final String apitoken=CacheHelper.getData(key: 'id');
    try {
      // Define the data to be sent in the request body
      Map<String, dynamic> data = {
        'title': title,
        'cost': cost,
      };
      // Send a POST request with the data to the specified URL
      Response response = await _dio.post(
        'https://walletapp-cr96.onrender.com/api/v1/income/$apitoken',
        data: data,
      );
//65e77dfc1c4a15ae7c2056d6
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
}
