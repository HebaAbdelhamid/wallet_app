import 'package:dio/dio.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

class AddBills {
  final Dio _dio = Dio();

  Future<void> postData(String title, int cost) async {
    final String apitoken=CacheHelper.getData(key: 'id');

    try {
      Map<String, dynamic> data = {
        'title': title,
        'cost': cost,

      };

      Response response = await _dio.post(
        'https://walletapp-cr96.onrender.com/api/v1/saving/bills/$apitoken',
        data: data,
      );

      if (response.statusCode == 201) {
        print('Data created successfully');
      } else {
        throw Exception('Failed to create data');
      }
    } catch (e) {
      throw Exception('Failed to create data: $e');
    }
  }
}
