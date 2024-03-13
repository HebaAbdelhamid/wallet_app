import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:wallet_app/Screens/income_chart.dart';
import 'package:wallet_app/widgets/categories.dart';
class Category_Chart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return Category_ChartState();
  }

}

class Category_ChartState extends State<Category_Chart> {

  double _sliderValue = .7;
  final dataMap = <String, double>{
    "Food & Drinks":5,
    "Recycling": 3,
    "Tickets": 2,
    "Shopping": 2,
  };
List _slidersValue=[.7,.6,.5,.7];


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
    const Color(0xfff3e6e3),

  ];

  bool _showCenterText = true;
  bool _showCenterWidget = true;
  double? _chartLegendSpacing = 60;

List<String>_category=[ "Food & Drinks","Recycling","Tickets","Shopping"];

  int key = 0;

  @override
  Widget build(BuildContext context) {

    final chart = PieChart(
      key: ValueKey(key),
      dataMap: {
        "Food & Drinks": 7,
        "Recycling": 6,
        "Tickets": 5,
        "Shopping": 7,
      },
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing!,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      centerText: _showCenterText ? "   " : null,
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
    );


    return Scaffold(

        body:SafeArea(
        child: SingleChildScrollView(
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
                  child: chart,
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
                        Text('Categories'),
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
                }, itemCount: colorList.length)




              ],
            ),
          ),
        ),
      )
    );
  }

  Column buildColumnategorySlider(int index) {
    return Column(
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
                        Text('${_slidersValue[index]*1000}EGP'),
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
                );
  }
}
