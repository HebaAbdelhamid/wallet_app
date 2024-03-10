import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallet_app/data/model/modell/incomeModel.dart';
import 'package:wallet_app/screen/incomes.dart';

import '../widgets/categories.dart';

class Home extends StatefulWidget {
  final int total;
  Home(this.total);







  @override
  State<StatefulWidget> createState() {
    return Home_State();
  }
}

class Home_State extends State<Home> {
  late int totalIncome=0;
  void initState() {
totalIncome=widget.total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f2f2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Row(
                  children: [
                    Stack(children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xffDBE7C9),
                        radius: 28,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: (CircleAvatar(
                          backgroundImage: AssetImage(
                            "images/5-512.webp",
                          ),
                          radius: 23,
                        )),
                      ),
                    ]),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          ' ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Color(0xffDBE7C9), shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            Icons.circle_notifications,
                            size: 28,
                          ),
                          color: Colors.black,
                          onPressed: () {},
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('$totalIncome EGP',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => IncomesScreen()));
                        },
                        child: Container(
                          height: 110,
                          width: 170,
                          decoration: BoxDecoration(
                              color: Color(0xffDBE7C9),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.download_sharp,
                                color: Colors.green,
                              ),
                              const Text(
                                'Incomes',
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                '${totalIncome} EGP',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 110,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Color(0xffDBE7C9),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upgrade_outlined,
                            color: Colors.red,
                            size: 33,
                          ),
                          Text(
                            'Expenses',
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            '0 EGP',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 350,
                    height: 185,
                    decoration: BoxDecoration(
                        color: const Color(0xffDBE7C9),
                        borderRadius: BorderRadius.circular(18)),
                    child: ListView.separated(
                      itemCount: categories.length,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      itemBuilder: (context, index) =>
                          CategoryWidget(category: categories[index]),
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
            child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: Color(0xffDBE7C9), shape: BoxShape.circle),
                child: CircleAvatar(
                  backgroundImage: AssetImage(category.image),
                  radius: 20,
                )),
          ),
          Center(
              child: Text(
            category.name,
            style: TextStyle(
              fontSize: 18,
            ),
            maxLines: 3,
          )),
        ],
      ),
    );
  }
}
