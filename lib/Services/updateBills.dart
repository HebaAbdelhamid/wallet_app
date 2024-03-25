import 'package:dio/dio.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

class UpdateBills {
  final Dio _dio = Dio();

  Future<void> updateData(String id, String title, int cost) async {
    final String apitoken=CacheHelper.getData(key: 'id');

    try {
      Map<String, dynamic> data = {
        'title': title,
        'cost': cost,
      };

      Response response = await _dio.put(
        'https://walletapp-cr96.onrender.com/api/v1/saving/bills/$apitoken/$id',
        data: data,
      );

      if (response.statusCode == 200) {
        print('Data updated successfully');
      } else {
        throw Exception('Failed to update data');
      }
    } catch (e) {
      throw Exception('Failed to update data: $e');
    }
  }
}
