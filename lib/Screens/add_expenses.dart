import 'package:flutter/material.dart';
import 'package:wallet_app/Screens/bottonNavigationBar.dart';
import 'package:wallet_app/dio/category/addcategory.dart';

class AddExpensesPage_ extends StatefulWidget {
  @override
  _AddExpensesPageState createState() => _AddExpensesPageState();
}

class _AddExpensesPageState extends State<AddExpensesPage_> {
  final AddCategory addcategory__ = AddCategory();

  late TextEditingController _descriptionController;
  late TextEditingController _costController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _costController = TextEditingController();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          " Add Expenses",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Enter Description ',
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: TextField(
                  controller: _descriptionController,
                  onTap: () {
                    setState(() {});
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(11)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(11)),
                      labelText: 'Enter Description'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'Enter Cost ',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: TextField(
                  controller: _costController,
                  onTap: () {
                    setState(() {});
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(11)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(11)),
                      labelText: 'Enter Cost'),
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      //eman
                      TextEditingController categoryNameController =
                          TextEditingController();
                      TextEditingController descriptionController =
                          TextEditingController();
                      TextEditingController costController =
                          TextEditingController();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Add New Category'),
                              content: SizedBox(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, bottom: 4),
                                        child: TextField(
                                          controller: categoryNameController,
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 10),
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11)),
                                              labelText: 'Enter Category Name'),
                                        ),
                                      ),
                                     /* Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, bottom: 4),
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[
                                                200], // Set the background color
                                            border: Border.all(
                                                color: Colors
                                                    .grey), // Set the border color
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 7),
                                            child: Row(
                                              children: [
                                                Text('Upload Image'),
                                                Expanded(child: SizedBox()),
                                                Icon(Icons.upload)
                                                // Add additional widgets as needed
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),*/
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xFF294B29),
                                          ),
                                          child: MaterialButton(
                                            minWidth: double.infinity,
                                            onPressed: () {
                                              setState(() {
                                                addcategory__.postCategory(
                                                    categoryNameController
                                                        .text);
                                              });
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Botton_Navigation_Bar()),
                                              );
                                              // print(
                                              //     "Category Name: ${categoryNameController.text}");
                                              // print(
                                              //     "Description: ${descriptionController.text}");
                                              // print(
                                              //     "Cost: ${costController.text}");
                                            },
                                            padding: const EdgeInsets.only(
                                                right: 4, left: 4),
                                            child: const Text(
                                              'Save',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'Add New Category',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF294B29),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      print("Description: ${_descriptionController.text}");
                      print("Cost: ${_costController.text}");
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   return ExpensiveScreen(
                      //     id: ,
                      //   );
                      // }));
                    },
                    padding: const EdgeInsets.only(right: 4, left: 4),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
