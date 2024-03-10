import 'package:flutter/material.dart';
import 'package:wallet_app/data/model/modell/newincome.dart';

class NewfutureplaningProvider extends ChangeNotifier {
  List<NewIncomeModel> _newIncomes = [];

  List<NewIncomeModel> get newIncomes => _newIncomes;

  void addNewIncome(NewIncomeModel newIncome) {
    _newIncomes.add(newIncome);
    notifyListeners();
  }
}
