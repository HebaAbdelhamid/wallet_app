import 'package:flutter/material.dart';

import '../data/model/modell/newincome.dart';

class NewIncomeProvider extends ChangeNotifier {
  List<NewIncomeModel> _newIncomes = [];

  List<NewIncomeModel> get newIncomes => _newIncomes;

  void addNewIncome(NewIncomeModel newIncome) {
    _newIncomes.add(newIncome);
    notifyListeners();
  }
}
