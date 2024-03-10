import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/Screens/bottonNavigationBar.dart';

class Account_Create extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Account_Create_State();
  }

}
class Account_Create_State extends State<Account_Create>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset("images/Frame.png",width: 140,)),
                //SizedBox(height: 18,),
                Text('Congratulations your',style:TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                Text('Account has been ',style:TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                Text('Created',style:TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                SizedBox(height: 35,),
                OutlinedButton(
                  onPressed: () {
                     Navigator.of(context).push( MaterialPageRoute(builder: (context){return Botton_Navigation_Bar();}));
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(80, 63),shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),),side: BorderSide(color: const Color(
                      0xFF294B29)),),
                 // borderSide: BorderSide(color: Colors.black),
                  child: const Text(
                    'Ok',
                    style: TextStyle(color: const Color(0xFF294B29), fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),


              ],
            ),
          ),
        ),
      )
    );
  }

}