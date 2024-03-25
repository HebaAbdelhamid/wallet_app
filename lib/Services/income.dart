import 'package:dio/dio.dart';
import 'package:wallet_app/data/model/modell/incomeModel.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

class GetIncome {
  final Dio _dio = Dio();

  Future<List<IncomeModel>> fetchData() async {
    final String apitoken=CacheHelper.getData(key: 'id');

    try {
      Response response = await _dio.get('https://walletapp-cr96.onrender.com/api/v1/income/$apitoken');
//65e77dfc1c4a15ae7c2056d6
      if (response.statusCode == 200) {
        // Parse the response data into a list of IncomeModel objects
        List<dynamic> jsonData = response.data;
        List<IncomeModel> incomeList = jsonData.map((data) => IncomeModel.fromJson(data)).toList();
        return incomeList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
