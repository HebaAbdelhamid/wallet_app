import 'package:dio/dio.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

class DeleteIncome {
  final Dio _dio = Dio();

  Future<void> deleteData(String incomeId) async {
    final String apitoken=CacheHelper.getData(key: 'id');

    try {
      // Send a DELETE request to the specified URL


      Response response = await _dio.delete(

        'https://walletapp-cr96.onrender.com/api/v1/income/$apitoken/$incomeId',
      );

      if (response.statusCode == 200) {
        // If the request is successful (status code 200), do something
        print('Data deleted successfully');
      } else {
        // If the request is not successful, throw an exception
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      // If an error occurs during the request, throw an exception
      throw Exception('Failed to delete data: $e');
    }
  }
}
