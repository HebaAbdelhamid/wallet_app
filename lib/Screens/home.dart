import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/data/model/getcateory.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';
import 'package:wallet_app/dio/ApiDioServices.dart';
import 'package:wallet_app/screen/expense.dart';
import 'package:wallet_app/screen/incomes.dart';
import 'package:wallet_app/screen/notification.dart';

class Home extends StatefulWidget {
  final int total;
  Home(this.total);

  @override
  State<StatefulWidget> createState() {
    return Home_State();
  }
}

class Home_State extends State<Home> {
  int? salaryRest;

  late int totalIncome = 0;
  late Future<Category> futureCategories;
  var apitokenn = CacheHelper.getData(key: 'tokenn');

  void initState() {
    super.initState();
    totalIncome = widget.total;

    futureCategories = ApiDioServises.api.fetchNewsData("all", apitokenn);
    print('==============>$apitokenn');
    fetchData();
  }
  Future<void> fetchData() async {
    int? result = await fetchDataAndShowNotification();
    setState(() {
      salaryRest = result;
    });
  }
  Future<int?> fetchDataAndShowNotification() async {
    //final String userId = "65e77dfc1c4a15ae7c2056d6";
    final String userId=CacheHelper.getData(key: 'id');

    final String expensesApiUrl =
        "https://walletapp-cr96.onrender.com/api/v1/user/expenses";
    final String incomesApiUrl =
        "https://walletapp-cr96.onrender.com/api/v1/income/$userId";
    final String salaryRestApiUrl =
        "https://walletapp-cr96.onrender.com/api/v1/salary/salaryRest";

    // final String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc0xvZ2luIjp0cnVlLCJpZCI6IjY1ZTc3ZGZjMWM0YTE1YWU3YzIwNTZkNiIsImlhdCI6MTcwOTkwMjE5NH0.tlhg5YeQ-EVv-cb-Z5sjPBQCRwxmwLKlXrE7ZGThLOY";
    final String token = CacheHelper.getData(key: 'tokenn');

    try {
      // Fetch expenses
      final Response<dynamic> expensesResponse = await Dio().get(
        expensesApiUrl,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      final List<dynamic> expensesData = expensesResponse.data['userExpenses'];
      int totalExpenses = expensesData.fold<int>(
          0, (previous, current) => previous + (current['amount'] as int));

      // Fetch incomes
      final Response<dynamic> incomesResponse = await Dio().get(
        incomesApiUrl,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      final List<dynamic> incomesData = incomesResponse.data;
      int totalIncomes = incomesData.fold<int>(
          0, (previous, current) => previous + (current['cost'] as int));

      // Calculate the difference between incomes and expenses
      int salaryRest = totalIncomes - totalExpenses;
      return salaryRest;
    }catch(e){
      return salaryRest;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff3f2f2),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      children: [
                         Stack(children: [
                          CircleAvatar(
                            backgroundColor: Color(0xffDBE7C9),
                            radius: 28,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
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
                              'My friend',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                                color: Color(0xffDBE7C9),
                                shape: BoxShape.circle),
                            child: IconButton(
                              icon: Icon(
                                Icons.circle_notifications,
                                size: 28,
                              ),
                              color: Colors.black,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NotificationScreen()),
                                );
                              },
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
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Total Balance',
                          style: TextStyle(
                            fontSize: 27,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        salaryRest==null?CircularProgressIndicator():
                        Text('${salaryRest.toString()} EGP',
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
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => IncomesScreen()));
                            },
                            child: Container(
                              height: 110,
                              width: 170,
                              decoration: BoxDecoration(
                                color: Color(0xffDBE7C9),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    spreadRadius: 2, // Spread radius
                                    blurRadius: 7, // Blur radius
                                    offset: Offset(
                                        0, 3), // Offset from the container
                                  ),
                                ],
                              ),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.download_sharp,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    'Incomes',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  /* Text(
                                  '${totalIncome} EGP',
                                  style: TextStyle(fontSize: 20),
                                )*/
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: 110,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Color(0xffDBE7C9),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.2), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  offset:
                                      Offset(0, 3), // Offset from the container
                                ),
                              ],
                            ),
                            child:  Column(
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
                              ],
                            ),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 27),
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
                            child: FutureBuilder<Category>(
                              future: futureCategories,
                              builder: (context, snapshot) {
                                if (!mounted) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else {
                                  List<UserCategories>? categories =
                                      snapshot.data?.userCategories;

                                  return ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    itemCount: categories?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ExpensiveScreen(
                                                  category: snapshot.data
                                                      ?.userCategories![index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 28.0,
                                                      vertical: 20),
                                                  child: Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color(
                                                                  0xffDBE7C9),
                                                              shape: BoxShape
                                                                  .circle),
                                                      child: const CircleAvatar(
                                                        backgroundImage: AssetImage(
                                                            'images/line-icon-for-category-vector.jpg'),
                                                        radius: 20,
                                                      )),
                                                ),
                                                Center(
                                                    child: Text(
                                                  categories?[index]
                                                          .categoryName ??
                                                      'No Name',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                  maxLines: 3,
                                                )),
                                              ],
                                            ),
                                          ));
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 10),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                  );
                                }
                              },
                            ))
                      ]),
                ])))));
  }
}
