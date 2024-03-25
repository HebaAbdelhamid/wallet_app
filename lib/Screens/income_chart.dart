import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:wallet_app/Screens/category_chart.dart';
import 'package:wallet_app/Screens/eachCategory_chart.dart';
import 'package:wallet_app/Services/income.dart';
import 'package:wallet_app/data/model/modell/incomeModel.dart';
import 'package:wallet_app/screen/expense.dart';
import 'package:wallet_app/screen/incomes.dart';
class Income_Chart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Income_ChartState();
  }

}

class Income_ChartState extends State<Income_Chart> {
  late Future<List<IncomeModel>> futureIncome;
  String categoryId = '65e781eb708e682e7263d7fc';

  double _sliderValue = .7;

  List _slidersValue=[.7,.6,.7,.6,.7,.6,];


  final colorList = <Color>[
    const Color(0xFF294B29),
    const Color(0xff088718),

  ];
  final colorList_ = <Color>[
    const Color(0xFFA2BFA2),
    const Color(0xffd0eed8),

  ];

  bool _showCenterText = true;
  bool _showCenterWidget = true;
  double? _chartLegendSpacing = 60;

  List<String>_category=[ "Feelance","Salary",];

  int key = 0;
  void initState() {
    super.initState();
    futureIncome = GetIncome().fetchData() ;
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(

        body:SafeArea(
          child: FutureBuilder<List<IncomeModel>>(
            future: GetIncome().fetchData(),
            builder: (context, snapshot) {
              print('==========$snapshot.data');
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No Income found, Add it t view it in chart.'));
              }
              Map<String, double> expenseMap = Map.fromIterable(
                snapshot.data!.toList() ,
                key: (expense) => expense.title,
                value: (expense) => expense.cost.toDouble(),
              );
              return  SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // IconButton(
                          //   icon: Icon(Icons.arrow_back),
                          //   onPressed: () {
                          //     Navigator.of(context).pushReplacement(
                          //       MaterialPageRoute(builder: (context) => EachCategory_Chart()),
                          //     );
                          //   },
                          // ),
                          InkWell(
                            onTap: (){

                            },
                            child: Container(
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
                                  Text('Month'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 40),
                        child: PieChart(
                          key: ValueKey(key),
                          dataMap: expenseMap,
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: _chartLegendSpacing!,
                          colorList: colorList,
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          centerText: _showCenterText ? "       " : null,
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
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: const Color(
                                    0xFF294B29)),
                            child: Center(child: Text('Income',style: TextStyle(color: Colors.white),)),
                          ),

                          Expanded(child: SizedBox()),
                          /*InkWell(
                            onTap: (){
                              Navigator.of(context).push( MaterialPageRoute(builder: (context){return EachCategory_Chart();}));

                            },
                            child: Container(
                              width: 140,
                              height: 40,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.white),
                              child: Center(child: Text('Expense',style: TextStyle(color: Colors.black),)),
                            ),
                          ),*/


                        ],
                      ),
                      SizedBox(height: 44,),
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

  FutureBuilder<List<IncomeModel>> buildColumnategorySlider(int index) {
    return FutureBuilder<List<IncomeModel>>(
      future: GetIncome().fetchData(),
      builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<IncomeModel> incomes = snapshot.data!;
          return
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('${incomes[index].title}'),
                    ),
                    Expanded(child: SizedBox()),
                    Text('${incomes[index].cost}EGP'),
                  ],
                ),
                SizedBox(height: 7),
                Slider(
                  activeColor: Color(0xFF294B29),
                  inactiveColor: Color(0xFFA2BFA2),
                  value: _slidersValue[index],
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = _sliderValue;
                    });
                  },
                ),
              ],
            );
        }}

    );
  }
}
