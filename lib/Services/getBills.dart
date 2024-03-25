import 'package:dio/dio.dart';
import 'package:wallet_app/data/model/modell/billsModell.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';


class GetBills {
  final Dio _dio = Dio();

  Future<List<BillsModel>> fetchData() async {
    final String apitoken=CacheHelper.getData(key: 'id');

    try {
      Response response = await _dio.get('https://walletapp-cr96.onrender.com/api/v1/saving/bills/$apitoken');

      if (response.statusCode == 200) {
        // Parse the response data into a list of IncomeModel objects
        List<dynamic> jsonData = response.data;
        List<BillsModel> incomeList = jsonData.map((data) => BillsModel.fromJson(data)).toList();
        return incomeList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
