import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/Screens/bottonNavigationBar.dart';
import 'package:wallet_app/Screens/eachCategory_chart.dart';
import 'package:wallet_app/Screens/home.dart';
import 'package:wallet_app/Services/PostExpense.dart';
import 'package:wallet_app/Services/deleteExp.dart';
import 'package:wallet_app/Services/getExpen.dart';
import 'package:wallet_app/data/model/modell/expensesmodel.dart';
import 'package:wallet_app/screen/addExp.dart';
import 'package:wallet_app/screen/editExp.dart';

import '../data/model/getcateory.dart';

class ExpensiveScreen extends StatefulWidget {
  final UserCategories? category;

  const ExpensiveScreen({super.key, required this.category});
  @override
  _ExpensiveScreenState createState() => _ExpensiveScreenState();
}

class _ExpensiveScreenState extends State<ExpensiveScreen> {
  final DeleteExpense deleteExpenseService = DeleteExpense();
  final GetExpense _getExpenseService = GetExpense();
  final AddExpense _addExpenseService = AddExpense();
  late List<Expense> expense;
  late List<Expense> originalExpense;
  late StreamController<Expense> _expenseController;
  int totalExpense = 0;
  var searchController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    expense = [];
    log(widget.category!.categoryName!, name: 'ExpensiveScreen');
    _expenseController = StreamController<Expense>.broadcast();
    _fetchExpenseData(widget.category!.sId!);
  }

  void _fetchExpenseData(String categoryId) async {
    try {
      List<Expense> fetchedExpenses =
          await _getExpenseService.fetchExpenses(categoryId);
      setState(() {
        expense = fetchedExpenses;
        originalExpense = List.from(fetchedExpenses);
      });
    } catch (e) {
      print('Error fetching expenses: $e');

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'An error occurred while fetching expenses. Please try again later.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _deleteExpense(String expenseId, int index) async {
    setState(() {
      expense.removeAt(index);
    });

    try {
      await deleteExpenseService.deleteExpense(expenseId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expense deleted successfully'),
        ),
      );
    } catch (e) {
      print('Error deleting expense: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete expense: $e'),
        ),
      );
    }
  }

  int _calculateTotalExpense() {
    int total = 0;
    for (Expense exp in expense) {
      total += exp.amount;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return widget.category != null
        ?
    Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Botton_Navigation_Bar()),
                  );
                },
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => EachCategory_Chart(category:widget.category!,)),
                      );
                    },
                    child: Text(
                      'Report chart',
                      style: TextStyle(color: Colors.green),
                    )),
                IconButton(
                  icon: const Icon(
                    Icons.filter_alt,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    scaffoldKey.currentState!.showBottomSheet(
                      (context) => Container(
                        height: 300,
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      expense = List.from(originalExpense);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.refresh),
                                      SizedBox(width: 5),
                                      Text('Reset Data'),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          expense.sort((a, b) => a.description
                                              .compareTo(b.description));
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.sort),
                                          SizedBox(width: 5),
                                          Text('Sort Letters'),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          expense.sort((a, b) =>
                                              a.amount.compareTo(b.amount));
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.sort),
                                          SizedBox(width: 5),
                                          Text('Sort Amount'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextFormField(
                                controller: searchController,
                                decoration: const InputDecoration(
                                  labelText: 'Search',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    expense = originalExpense
                                        .where((exp) => exp.description
                                            .toLowerCase()
                                            .startsWith(value.toLowerCase()))
                                        .toList();
                                  });
                                },
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xFF294B29),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      elevation: 20.0,
                    );
                  },
                ),
              ],
            ),
            body: expense.isEmpty
                ? const Center(
                    child: Text('No data available'),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: expense.length,
                          itemBuilder: (context, index) {
                            Expense expenses = expense[index];
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        expenses.description,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //Dateeeeeeeeeeeeee
                                      Text(
                                        DateFormat('dd-MM-yyyy')
                                            .format(DateTime.parse(
                                                expenses.createdAt))
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(0.5),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    expenses.amount.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
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
                                              EditExpenseScreen(
                                            expense: expenses,
                                            expenseController:
                                                _expenseController,
                                            refreshExpenses:
                                                (String categoryId) {
                                              _fetchExpenseData(categoryId);
                                            },
                                            subCategoryId:
                                                widget.category!.sId!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: Color(0xff19F622),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      _deleteExpense(expenses.id, index);
                                    },
                                    child: const Icon(
                                      Icons.delete_outline_rounded,
                                      color: Color(0xffFF0000),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 100),
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
                              color: const Color(0xFFDBE7C9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Total Expenses",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  width: 90,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      "${_calculateTotalExpense()} EGP",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddExpensiveScreen(
                          refreshExpenses: _fetchExpenseData,
                          userId: widget.category!.userId!,
                          categoryId: widget.category!.sId!)),
                );
                if (result == true) {
                  _fetchExpenseData(widget.category!.sId!);
                }
              },
              backgroundColor: const Color(0xFF294B29),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        : const Scaffold(
            body: Center(
              child: Text('Add category first '),
            ),
          );
  }
}
