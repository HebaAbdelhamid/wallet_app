import 'package:flutter/material.dart';
import 'package:wallet_app/Services/addBills.dart';
import 'package:wallet_app/data/model/modell/billsModell.dart';


class AddBillsScreen extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController costController = TextEditingController();

  AddBillsScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Bills',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
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
                  final newBill = BillsModel(
                    title: descriptionController.text,
                    cost: int.tryParse(costController.text) ?? 0,
                  );
                  final billsService = AddBills();
                  try {
                    // Call the postData method to send a POST request
                    await billsService.postData(
                        newBill.title!, newBill.cost!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Bill added successfully'),
                      ),
                    );
                    Navigator.pop(context, true);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to add Bill: $e'),
                      ),
                    );
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
