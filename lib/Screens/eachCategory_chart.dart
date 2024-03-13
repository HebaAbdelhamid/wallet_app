import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:wallet_app/Screens/income_chart.dart';
import 'package:wallet_app/Services/getExpen.dart';
import 'package:wallet_app/data/model/modell/expensesmodel.dart';
import 'package:wallet_app/screen/expense.dart';
import 'package:wallet_app/widgets/categories.dart';
class EachCategory_Chart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EachCategory_ChartState();
  }

}

class EachCategory_ChartState extends State<EachCategory_Chart> {
  GetExpense getExpense = GetExpense();
  String categoryId = '65e781eb708e682e7263d7fc';
  late List<Expense> expense;




  double _sliderValue = .7;
  final dataMap = <String, double>{
    "default1":5,
    "default2": 3,
    "default3": 2,

  };
  List _slidersValue=[.7,.6,.5,.7,.7,.6,.5,.7];


  final colorList = <Color>[
    const Color(0xFF294B29),
    const Color(0xff088718),
    const Color(0xfffd79a8),
    const Color(0xffe17055),

  ];
  final colorList_ = <Color>[
    const Color(0xFFA2BFA2),
    const Color(0xffd0eed8),
    const Color(0xffecdfe3),
    const Color(0xFFA2BFA2),
    const Color(0xffd0eed8),
    const Color(0xffecdfe3),


  ];

  bool _showCenterText = true;
  bool _showCenterWidget = true;
  double? _chartLegendSpacing = 60;

  List<String>_category=[ "Pizza","Fish","Orange"];

  int key = 0;

  @override
  Widget build(BuildContext context) {




    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  leading:IconButton(
    icon: Icon(Icons.arrow_back,color: Colors.black,),
    onPressed: () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ExpensiveScreen(category:categories.last)),
      );
    },
  ),
),
        body:Container(
          child: FutureBuilder<List<Expense>>(
            future: getExpense.fetchExpenses(categoryId),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No expenses found, Add it t view it in chart.'));
              }
              Map<String, double> expenseMap = Map.fromIterable(
                snapshot.data!.toList() ,
                key: (expense) => expense.description,
                value: (expense) => expense.amount.toDouble(),
              );
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [

                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(
                              color: Colors.grey,
                            ),color: Colors.white),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_down,color: Colors.purple,),
                                Text('Daily'),
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 40),
                        child:  PieChart(
                          key: ValueKey(key),
                          dataMap: expenseMap,
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: _chartLegendSpacing!,
                          colorList: colorList,
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          centerText: _showCenterText ? "     " : null,
                          centerWidget: _showCenterWidget
                              ? Container(
                              color: Colors.white, child: const Text("       ",style: TextStyle(fontWeight: FontWeight.w500),))
                              : null,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: true,
                          ),
                          ringStrokeWidth: 32,
                          emptyColor: Colors.grey,
                          emptyColorGradient: const [
                            Color(0xff6c5ce7),
                            Colors.blue,
                          ],
                          baseChartColor: Colors.transparent,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 140,
                            height: 40,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:const Color(
                                0xFF294B29)),
                            child: Center(child: Text('Expense',style: TextStyle(color: Colors.white),)),
                          ),
                          Expanded(child: SizedBox()),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push( MaterialPageRoute(builder: (context){return Income_Chart();}));

                            },
                            child: Container(
                              width: 140,
                              height: 40,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  color: Colors.white),
                              child: Center(child: Text('Income')),
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 8),
                        child: Container(
                          width: 140,
                          height: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(
                            color: Color(0x99f3d1ff),
                          ),color: Colors.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_down,color: Colors.purple,),
                              Text('Expenses'),
                            ],
                          ),
                        ),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildColumnategorySlider(index);
                          }, separatorBuilder: (BuildContext context,int){
                        return SizedBox(height: 7,);
                      }, itemCount: snapshot.data!.length)




                    ],
                  ),
                ),
              );
            }),

          ),
    );

  }

  FutureBuilder<List> buildColumnategorySlider(int index) {
    return FutureBuilder<List<Expense>>(
      future: getExpense.fetchExpenses(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No expenses found.');
        } else {
          // Data is available, display the expenses in a ListView
          List<Expense> expenses = snapshot.data!;
          return Container(
            height: 700,
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                Expense expense = expenses[index];
                return    Column(
mainAxisSize: MainAxisSize.min,
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.circular(20) ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(expense.description),
              ),
              Expanded(child: SizedBox()),
              Text('${expense.amount}EGP'),
            ],
        ),
        SizedBox(height: 7),
        Slider(
            activeColor:colorList[index] ,
            inactiveColor:colorList_[index] ,
            value: _slidersValue[index],
            onChanged: (value) {
              setState(() {
                print(expense.description);
                _sliderValue = _sliderValue;
              });
            },
        ),
      ],
    );
                 /* Column(
mainAxisSize: MainAxisSize.min,
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(color:colorList[index],borderRadius: BorderRadius.circular(20) ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(expense.description),
              ),
              Expanded(child: SizedBox()),
              Text('${expense.amount*100}EGP'),
            ],
        ),
        SizedBox(height: 7),
        Slider(
            activeColor:colorList[index] ,
            inactiveColor:colorList_[index] ,
            value: _slidersValue[index],
            onChanged: (value) {
              setState(() {
                print(expense.description);
                _sliderValue = _sliderValue;
              });
            },
        ),
      ],
    );*/

              },
            ),
          );
        }
      },
    );
    /*
      Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(color:colorList[index],borderRadius: BorderRadius.circular(20) ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(_category[index]),
            ),
            Expanded(child: SizedBox()),
            Text('${_slidersValue[index]*100}EGP'),
          ],
        ),
        SizedBox(height: 7),
        Slider(
          activeColor:colorList[index] ,
          inactiveColor:colorList_[index] ,
          value: _slidersValue[index],
          onChanged: (value) {
            setState(() {
              _sliderValue = _sliderValue;
            });
          },
        ),
      ],
    );*/
  }
}
/*ListTile(
title: Text('Description: ${expense.description}'),
subtitle: Text('Amount: ${expense.amount} EGP'),
);*/