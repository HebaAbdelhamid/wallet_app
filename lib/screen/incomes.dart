import 'package:flutter/material.dart';
import 'package:wallet_app/Screens/home.dart';
import 'package:wallet_app/Services/AddIncome.dart';
import 'package:wallet_app/Services/deleteincome.dart';


import 'dart:async';

import 'package:wallet_app/Services/income.dart';
import 'package:wallet_app/data/model/modell/incomeModel.dart';
import 'package:wallet_app/screen/addIncomes.dart';
import 'package:wallet_app/screen/editIncome.dart';

class IncomesScreen extends StatefulWidget {

  @override
  _IncomesScreenState createState() => _IncomesScreenState();
}

class _IncomesScreenState extends State<IncomesScreen> {
  late int totalIncome=0;
  final GetIncome _getIncomeService = GetIncome();
  final AddIncome _addIncomeService = AddIncome();
  final DeleteIncome _deleteIncomeService = DeleteIncome();
  late List<IncomeModel> incomes;
  late StreamController<IncomeModel> _incomeController;


  @override
  void initState() {
    super.initState();
    incomes = [];
    _incomeController = StreamController<
        IncomeModel>.broadcast(); // Create a broadcast stream controller
    _fetchIncomeData();
  }

  @override
  void dispose() {
    _incomeController.close(); // Close the stream controller when not needed
    super.dispose();
  }

  void _fetchIncomeData() async {
    try {
      List<IncomeModel> fetchedIncomes = await _getIncomeService.fetchData();
      setState(() {
        incomes = fetchedIncomes;
      });
    } catch (e) {
      print('Error fetching income data: $e');
    }
  }

  Future<void> _deleteIncome(String incomeId, int index) async {
    setState(() {
      incomes.removeAt(index);
    });

    try {
      await _deleteIncomeService.deleteData(incomeId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Income deleted successfully'),
        ),
      );
    } catch (e) {
      print('Error deleting income: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete income: $e'),
        ),
      );
    }
  }
  int _calculateTotalIncome() {
     totalIncome = incomes.fold(
        0, (previousValue, element) => previousValue + (element.cost ?? 0));

    // Call the callback function with the calculated total income
   // widget.onTotalIncomeCalculated(totalIncome);
print(totalIncome);
    return totalIncome;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Incomes',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        ),
        leading: IconButton(icon:Icon(Icons.arrow_back), color: Colors.black,
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(totalIncome)),);
          },),
      ),
      body: incomes.isEmpty
          ? Center(
              child: Text('No data available'),
            )
          : StreamBuilder<IncomeModel>(
              stream:
                  _incomeController.stream, // Subscribe to the income stream
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: incomes.length,
                        itemBuilder: (context, index) {
                          IncomeModel income = incomes[index];
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      income.title ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      income.createdAt ?? '',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(0.5),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  income.cost.toString() ?? '',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            EditIncomeScreen(
                                                income: income,
                                                incomeController:
                                                    _incomeController), // Pass the income controller to the EditIncomeScreen
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Color(0xff19F622),
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    _deleteIncome(income.sId!, index);
                                  },
                                  child: Icon(
                                    Icons.delete_outline_rounded,
                                    color: Color(0xffFF0000),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Divider(
                        indent: 30,
                        endIndent: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 55),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFDBE7C9),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Total Incomes",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    "${_calculateTotalIncome()} EGP",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black),
                                ),
                                width: 90,
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddIncomeScreen()),
          );
          if (result == true) {
            _fetchIncomeData(); // Reload income data if a new income is added
          }
        },
        backgroundColor: Color(0xFF294B29),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  /*int _calculateTotalIncome() {
    return incomes.fold(
        0, (previousValue, element) => previousValue + (element.cost ?? 0));
    widget.onTotalIncomeCalculated(totalIncome);

    return totalIncome;
  }*/

}

