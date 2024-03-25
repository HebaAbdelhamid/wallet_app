import 'package:dio/dio.dart';
import 'package:wallet_app/data/model/modell/expensesmodel.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

class GetExpense {
  final Dio _dio = Dio();

  Future<List<Expense>> fetchExpenses(String categoryId) async {
    final String apiUrl =
        'https://walletapp-cr96.onrender.com/api/v1/user/expenses?categoryId=$categoryId';
    final String token = CacheHelper.getData(key: 'tokenn');

    try {
      final response = await _dio.get(apiUrl,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData != null && responseData.containsKey('userExpenses')) {
          final List<dynamic> expensesData = responseData['userExpenses'];
          return expensesData.map((data) => Expense.fromJson(data)).toList();
        } else {
          throw Exception('Unexpected response format: $responseData');
        }
      } else {
        throw Exception(
            'Failed to load expenses. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load expenses: $e');
    }
  }
}
