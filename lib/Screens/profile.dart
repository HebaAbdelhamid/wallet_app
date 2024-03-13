import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/Screens/edit_Account.dart';
import 'package:wallet_app/Screens/login.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';
import 'package:wallet_app/screen/splach.dart';

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return Profile_State();
  }

}
class Profile_State extends State<Profile>{
  bool apollingEnabled = true;

  @override
  Widget build(BuildContext context) {
    bool isOn=false;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
       /* leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,size: 20,),
          color: Colors.black,

          onPressed: () {},),*/
        title: const Text(" My Profile",
          style: TextStyle(color: Colors.black,fontSize: 20),),
        ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:150,vertical: 16),
            child: CircleAvatar( radius:40,backgroundImage: AssetImage('images/5-512.webp'),),),
          Text("Username",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w500),),
          Padding(
            padding: const EdgeInsets.only(top:7.0,bottom: 17),
            child: Text("*********@gmail.com",style: TextStyle(color: Colors.black,fontSize: 16,),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0,vertical: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xffDBE7C9),borderRadius: BorderRadius.circular(18),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 10)]),
                    height: 55,
                    child: ListTile(
                      leading: Icon(Icons.notifications_none,color: Color(0xFF294B29),),
                      title: Text(
                        "Notifications",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      trailing: Switch(
                        value: apollingEnabled,
                        onChanged: (value) {
                          setState(() {
                            apollingEnabled = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),

                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xffDBE7C9),borderRadius: BorderRadius.circular(18),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 4)]),
                    height: 55,
                    child: ListTile(
                      leading: Icon(Icons.settings,color: Color(0xFF294B29),),
                      title: Text(
                        "Edit Account",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      trailing: IconButton(onPressed: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context){return Log_In(); }));
                      }, icon: IconButton(icon:Icon(Icons.arrow_forward_ios_sharp),color:const Color(
                          0xFF294B29) ,onPressed: (){
                         Navigator.of(context).push( MaterialPageRoute(builder: (context){return Edit_Account();}));
                      },)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),

                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xffDBE7C9),borderRadius: BorderRadius.circular(18),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 10)]),
                    height: 55,
                    child: ListTile(
                      leading: Icon(Icons.refresh,color: Color(0xFF294B29),),
                      title: Text(
                        "Change profile",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      trailing:IconButton(onPressed: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context){return Log_In(); }));
                      }, icon: Icon(Icons.arrow_forward_ios_sharp,color:const Color(
                          0xFF294B29) ,)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:const Color(0xffDBE7C9),
                    ),
                    child: MaterialButton(minWidth: double.infinity,
                      onPressed: (){
                        // Navigator.of(context).push( MaterialPageRoute(builder: (context){return Register_Complete();}));
                      _showButtonSheet(context);
                      },
                      padding: const EdgeInsets.only(right: 4,left: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout,color: Color(0xFF294B29),),
                          Padding(
                            padding: const EdgeInsets.only(left: 9.0),
                            child: const Text('Log out',style: TextStyle(fontSize: 20),),
                          ),
                        ],
                      ),

                    ),),
                ),
              ],
            ),
          )





        ],
      ),

    );
  }
  void _showButtonSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Log Out ?',
                    style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Are you sure do you want to logout?',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(17))),
                    onPressed: () {
                      // Handle first button press
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Text('No',style: TextStyle(color: Colors.black),),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(
                        0xFF294B29),shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)) ),
                    onPressed: () {
                      CacheHelper.removeData(key: 'token').then((value) => Log_In());
                     // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Log_In()),);
                    },
                    child: Text('Yes',style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}