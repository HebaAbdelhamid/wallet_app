import 'package:flutter/material.dart';
import 'package:wallet_app/screen/futureplanning.dart';

class FuturePlanning extends StatefulWidget {
  @override
  _FuturePlanningState createState() => _FuturePlanningState();
}

class _FuturePlanningState extends State<FuturePlanning> {
  bool savingsEnabled = true;
  bool apollingEnabled = true;
  bool billsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        /* leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,size: 20,),
          color: Colors.black,

          onPressed: () {},),*/
        title: const Text(" Savings",
          style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: ListView(
        children: [
          InkWell(
          onTap: (){
   // Navigator.of(context).push(MaterialPageRoute(builder: (context){return Proadcast_Child();}));
    },
      child: Stack(
        alignment: Alignment.center,
        children:[

          Container(
            width:double.infinity,
            height: 260,
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            decoration: BoxDecoration(color:Color(0xffDBE7C9),borderRadius: BorderRadius.circular(12),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 4)]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10) ,
                  child: Image.asset("images/Reading list-amico 1.png",height: 40,width: 40,)),
            ),),
          Positioned(
              bottom: 24, // Align the text to the bottom
              child: Container(
                  width: 140, // Same as the image width
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Center(
                      child: Text(
                        'Bills',
                        style: TextStyle(fontSize: 29,),
                      ),
                    ),
                  ),
              ))])
    ),
          SizedBox(
            height: 4,
          ),

          InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => futureplaningScreen()),
                );
                // Navigator.of(context).push(MaterialPageRoute(builder: (context){return Proadcast_Child();}));
              },
              child: Stack(
                  alignment: Alignment.center,
                  children:[

                    Container(
                      width:double.infinity,
                      height: 260,
                      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      decoration: BoxDecoration(color:Color(0xffDBE7C9),borderRadius: BorderRadius.circular(12),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 4)]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10) ,
                            child: Image.asset("images/79z_2203_w012_n001_48c_p6_48_1_1-removebg-preview 1.png",)),
                      ),),
                    Positioned(
                        bottom: 29, // Align the text to the bottom
                        child: Center(
                          child: Container(
                            width: 280, // Same as the image width
                            child:
                            Center(
                              child: Text(
                                'Future Planning',
                                style: TextStyle(fontSize: 29,),
                              ),
                            ),
                          ),
                        ))])
          ),
        ],
      ),
    );
  }
}