import 'package:flutter/material.dart';
import 'package:wallet_app/Screens/bottonNavigationBar.dart';
import 'package:wallet_app/widgets/categories.dart';

class Register_Complete_ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Register_Complete_State();
  }
}

class Register_Complete_State extends State<Register_Complete_> {
  TextEditingController _salaryTextEditingController = TextEditingController();
  TextEditingController _categorynameTextEditingController =
      TextEditingController();
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 68.0,
          left: 19,
          right: 19,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 18.0, top: 60),
                child: Center(
                  child: Text(
                    'Complete your data',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Times News Roman',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _salaryTextEditingController,
                onTap: () {
                  setState(() {});
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF294B29),
                      ),
                      borderRadius: BorderRadius.circular(11)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF294B29),
                      ),
                      borderRadius: BorderRadius.circular(11)),
                  labelText: 'Enter our salary',
                  suffixIcon: Icon(Icons.currency_pound),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemCount: count,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          //height: 270,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 4,
                                    blurRadius: 4)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                Text(
                                  'Add a name to the category you usually prefer to spend on',
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                TextField(
                                  onTap: () {},
                                  keyboardType: TextInputType.name,
                                  onSubmitted: (value) {
                                    setState(() {
                                      categories
                                          .add(Category(value, 'images/1.jpg'));
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF294B29),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF294B29),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                    labelText: 'Enter category name',
                                    suffixIcon: Icon(Icons.abc_rounded),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  'Upload related image to this category',
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 4),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[
                                          200], // Set the background color
                                      border: Border.all(
                                          color: Color(
                                              0xFF294B29)), // Set the border color
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.symmetric(
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                        height: 4,
                      )),
              InkWell(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Text(
                      'Add more Categories',
                      style: TextStyle(fontSize: 17),
                    ),
                    Icon(
                      Icons.add,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF294B29),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    setState(() {
                      categories.add(Category(
                          _categorynameTextEditingController.text,
                          'images/1.jpg'));
                    });

                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Botton_Navigation_Bar();
                    }));
                  },
                  padding: EdgeInsets.only(right: 4, left: 4),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              )
            ]),
      ),
    )));
  }
}
