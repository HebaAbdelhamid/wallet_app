import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

class AddExpense {
  final Dio _dio = Dio();

  Future<void> addExpense({
    required String userId,
    required String categoryId,
    required String description,
    required int amount,
  }) async {
    const String apiUrl =
        'https://walletapp-cr96.onrender.com/api/v1/expense/addExpense';
    final String token = CacheHelper.getData(key: 'tokenn');

    try {
      final response = await _dio.post(
        apiUrl,
        data: {
          'userId': userId,
          'categoryId': categoryId,
          'description': description,
          'amount': amount,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        log(response.data.toString(), name: "AddExpense");
      } else {
        throw Exception('Failed to add expense');
      }
    } catch (e) {
      throw Exception('Failed to add expense: $e');
    }
  }
}
