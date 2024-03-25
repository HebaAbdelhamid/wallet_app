import 'package:flutter/material.dart';
import 'package:wallet_app/Services/PostExpense.dart';

class AddExpensiveScreen extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final Function refreshExpenses;
  final String categoryId;
  final String userId;

  final AddExpense addExpenseService = AddExpense();

  AddExpensiveScreen(
      {required this.refreshExpenses,
      required this.categoryId,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Add ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF294B29)),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: costController,
              decoration: InputDecoration(
                labelText: 'Cost',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF294B29)),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                onPressed: () async {
                  try {
                    await addExpenseService.addExpense(
                      userId: userId,
                      categoryId: categoryId,
                      description: descriptionController.text,
                      amount: int.tryParse(costController.text) ?? 0,
                    );
                    refreshExpenses(categoryId);
                    Navigator.pop(context);
                  } catch (e) {
                    print('Failed to add expense: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF294B29),
                  minimumSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
