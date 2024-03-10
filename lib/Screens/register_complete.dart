import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/Screens/account_create.dart';
import 'package:wallet_app/Screens/home.dart';
import 'package:wallet_app/cubit/register_cubit.dart';
import 'package:wallet_app/cubit/register_state.dart';
import 'package:wallet_app/data/model/login_model.dart';
import 'package:wallet_app/data/model/register_model.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';


class Register_Complete extends StatefulWidget{

  const Register_Complete(SavedUser saveuser, );
  @override
  State<StatefulWidget> createState() {
   return Register_Complete_State();
  }

}
class Register_Complete_State extends State <Register_Complete>{
  TextEditingController _salaryTextEditingController=TextEditingController();
  TextEditingController _dateTextEditingController=TextEditingController();
  TextEditingController _categorynameTextEditingController=TextEditingController();
  int count=1;
  @override

  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
   return BlocBuilder<RegisterCubit,RegisterState>(
     builder: (context, state) {
       if(state is RegisterLoadingState){
         return Center(child: CircularProgressIndicator());
       }
       if(state is RegisterSuccessState){

         print('yyyyyy');
         //CacheHelper.saveData(key: 'token', value: state.registerModel!.savedUser!.token);

         print('ttttttttttttt');
         //Navigator.of(context).pushReplacement(
         // MaterialPageRoute(builder: (context) => Home()),
          //  );
         /*  .then((value) {
              print('ttttttttttttt');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()),
              );

            });*/



       }
       if(state is RegisterErrorState){
         return Scaffold(body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text('error in log in '),
           ],
         ));
       }
       else
       return  Scaffold(
           body:SafeArea(
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.only(top:68.0,left: 19,right: 19,),
                   child:Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Padding(
                           padding: EdgeInsets.only(left:18.0,right: 18.0,bottom: 18.0,top: 60),
                           child: Center(
                             child: Text('Complete your data',
                               style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,
                                 fontFamily:'Times News Roman',),),
                           ),
                         ),
                         SizedBox(
                           height: 16,
                         ),
                         TextField(
                           controller: _salaryTextEditingController,
                           onTap: (){
                             setState(() {
                             });
                           },
                           keyboardType: TextInputType.name,
                           decoration: InputDecoration(
                             contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                             filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xFF294B29), ),borderRadius:BorderRadius.circular(11) ),
                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xFF294B29), ),borderRadius:BorderRadius.circular(11) ),
                             labelText: 'Enter our salary',
                             suffixIcon: Icon(Icons.currency_pound),

                           ) ,


                         ),SizedBox(height: 17,),


                         ListView.separated(
                             shrinkWrap: true,
                             itemCount: count,
                             itemBuilder: (context, index) {
                               return  Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Container(
                                     width: double.infinity,
                                     //height: 270,
                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.white,
                                         boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 4,blurRadius: 4)]),
                                     child: Padding(
                                       padding: const EdgeInsets.all(18.0),
                                       child: Column(
                                         children: [
                                           Text('Add a name to the category you usually prefer to spend on',style: TextStyle(fontSize: 17),),SizedBox(height: 4,),
                                           TextField(
                                             controller: _categorynameTextEditingController,
                                             onTap: (){
                                               setState(() {
                                               });
                                             },
                                             keyboardType: TextInputType.name,
                                             decoration: InputDecoration(
                                               contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                                               filled: true,
                                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                               enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xFF294B29), ),borderRadius:BorderRadius.circular(11) ),
                                               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xFF294B29), ),borderRadius:BorderRadius.circular(11) ),
                                               labelText: 'Enter category name',
                                               suffixIcon: Icon(Icons.abc_rounded),

                                             ) ,


                                           ),
                                           SizedBox(height: 7,),
                                           Text('Upload related image to this category',style: TextStyle(fontSize: 17),),SizedBox(height: 4,),

                                           Padding(
                                             padding: const EdgeInsets.only(top: 4.0,bottom: 4),
                                             child: Container(
                                               height: 50,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(10),
                                                 color: Colors.grey[200], // Set the background color
                                                 border: Border.all(color:Color(0xFF294B29)), // Set the border color
                                               ),
                                               child: Padding(
                                                 padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
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
                                   SizedBox(height: 4,),

                                 ],
                               );
                             },separatorBuilder: (BuildContext context,int index)=>
                             SizedBox(height: 4,)

                         ),
                         InkWell(
                           onTap: (){
                             setState(() {
                               count++;
                             });
                           },
                           child: Row(

                             children: [
                               Expanded(child: SizedBox()),
                               Text('Add more Categories',style: TextStyle(fontSize: 17),),
                               Icon(Icons.add,),
                             ],
                           ),
                         ),
                         SizedBox(
                           height: 4,
                         ),
                         Container(
                           height: 45,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Color(
                               0xFF294B29),
                           ),
                           child: MaterialButton(minWidth: double.infinity,
                             onPressed: (){

                               Navigator.of(context).push( MaterialPageRoute(builder: (context){return Account_Create();}));
                             },
                             padding: EdgeInsets.only(right: 4,left: 4),
                             child: Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

                           ),),
                         SizedBox(height: 26,)

                       ]),

                 ),
               )));
     });


  }
  TextField buildTextField(String labletext,Icon icon) {
    return
      TextField(
      onTap: (){
        setState(() {
        });
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xFF294B29), ),borderRadius:BorderRadius.circular(11) ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xFF294B29), ),borderRadius:BorderRadius.circular(11) ),
        labelText: labletext,
        suffixIcon: icon,

      ) ,


    );
  }

}