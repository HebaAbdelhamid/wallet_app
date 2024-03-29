import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/Screens/home.dart';
import 'package:wallet_app/Screens/login.dart';
import 'package:wallet_app/Screens/registercomplete.dart';
import 'package:wallet_app/cubit/register_cubit.dart';
import 'package:wallet_app/cubit/register_state.dart';
import 'package:wallet_app/data/model/register_model.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Register_State();
  }

}
class Register_State extends State<Register>{
  SavedUser saveuser=SavedUser();

  TextEditingController _firstnameextEditingController=TextEditingController();
  TextEditingController _lastnameTextEditingController=TextEditingController();
  TextEditingController _emailTextEditingController=TextEditingController();
  TextEditingController _passwordTextEditingController=TextEditingController();
  TextEditingController _confirmpasswordTextEditingController=TextEditingController();

  TextEditingController _dateTextEditingController=TextEditingController();

  bool _passwordVisible=false;
  bool _passwordConfirm=false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   final registerCubit = BlocProvider.of<RegisterCubit>(context);
   return Scaffold(
     body:  BlocConsumer<RegisterCubit, RegisterState>(
       listener: (context, state) {
         if (state is RegisterSuccessState) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>Register_Complete_()),
        );



      }
         else if (state is RegisterErrorState) {
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(
               content: Text("Invalid Credentials Try again"),
             ),
           );
         }

       },
       builder: (context, state) {
         return SafeArea(
           child: SingleChildScrollView(
             child: Form(
               key:_formKey ,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   Padding(
                     padding: const EdgeInsets.only(top: 9),
                     child: IconButton(onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(
                           builder: (context) {
                             return Log_In();
                           }));
                     },
                         icon: Icon(
                           Icons.arrow_back_ios_sharp, color: const Color(
                             0xFF294B29),)),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(
                         top: 8.0, left: 19, right: 19, bottom: 19),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Padding(
                           padding: EdgeInsets.all(18.0),
                           child: Center(
                             child: Text('Register',
                               style: TextStyle(
                                 fontSize: 25, fontWeight: FontWeight.w500,
                                 fontFamily: 'Times News Roman',),),
                           ),
                         ),
                         Center(child: Image.asset(
                           "images/register.png", width: 140,)),
                         const SizedBox(
                           height: 8,
                         ),
                         TextFormField(
                           controller: _firstnameextEditingController,
                           keyboardType: TextInputType.name,
                           decoration: InputDecoration(
                             contentPadding: const EdgeInsets.symmetric(
                                 vertical: 15, horizontal: 10),
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
                             labelText: 'First Name',
                             suffixIcon: Icon(Icons.perm_identity),
                           ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter your First Name';
                             }
                             // You can add more complex validation logic here.
                             return null; // Return null if the input is valid.
                           },
                         ),
                         const SizedBox(height: 17,),
                         TextFormField(
                           controller: _lastnameTextEditingController,
                           keyboardType: TextInputType.name,
                           decoration: InputDecoration(
                             contentPadding: const EdgeInsets.symmetric(
                                 vertical: 15, horizontal: 10),
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
                             labelText: 'Last Name',
                             suffixIcon: Icon(Icons.perm_identity),
                           ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter your Last Name';
                             }
                             // You can add more complex validation logic here.
                             return null; // Return null if the input is valid.
                           },
                         ),
                         const SizedBox(height: 17,),

                         TextFormField(
                           controller: _emailTextEditingController,
                           keyboardType: TextInputType.emailAddress, // Use email address keyboard type
                           decoration: InputDecoration(
                             contentPadding: const EdgeInsets.symmetric(
                                 vertical: 15, horizontal: 10),
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
                             labelText: 'Your Email',
                             suffixIcon: Icon(Icons.email_outlined),
                           ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter your Email';
                             }
                             return null; // Return null if the input is valid.
                           },
                         ), const SizedBox(height: 17,),

                         TextFormField(
                           controller: _passwordTextEditingController,
                           keyboardType: TextInputType.text, // Use text keyboard type for passwords
                           obscureText: !_passwordVisible,
                           decoration: InputDecoration(
                             contentPadding: const EdgeInsets.symmetric(
                                 vertical: 15, horizontal: 10),
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
                             labelText: 'Password',
                             suffixIcon: IconButton(
                               icon: Icon(_passwordVisible
                                   ? Icons.visibility
                                   : Icons.visibility_off),
                               onPressed: () {
                                 setState(() {
                                   _passwordVisible = !_passwordVisible;
                                 });
                               },
                             ),
                           ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Password should be start with capital letter';
                             }
                             return null; // Return null if the input is valid.
                           },
                         ), const SizedBox(height: 17,),
                         TextFormField(
                           controller: _confirmpasswordTextEditingController,
                           keyboardType: TextInputType.text, // Use text keyboard type for passwords
                           obscureText: !_passwordConfirm,
                           decoration: InputDecoration(
                             contentPadding: const EdgeInsets.symmetric(
                                 vertical: 15, horizontal: 10),
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
                             labelText: 'cPassword',
                             suffixIcon: IconButton(
                               icon: Icon(_passwordConfirm
                                   ? Icons.visibility
                                   : Icons.visibility_off),
                               onPressed: () {
                                 setState(() {
                                   _passwordConfirm = !_passwordConfirm;
                                 });
                               },
                             ),
                           ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Password should be start with capital letter';
                             }
                             return null; // Return null if the input is valid.
                           },
                         ),


                         const SizedBox(height: 17,),
                         TextFormField(
                           controller: _dateTextEditingController,
                           keyboardType: TextInputType.name,
                           decoration: InputDecoration(
                             contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                             filled: true,
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                             enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Color(0xFF294B29)),
                               borderRadius: BorderRadius.circular(11),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Color(0xFF294B29)),
                               borderRadius: BorderRadius.circular(11),
                             ),
                             labelText: 'Due Date',
                             suffixIcon: IconButton(
                               icon: Icon(Icons.calendar_today_outlined),
                               onPressed: () async {
                                 final DateTime? pickedDate = await showDatePicker(
                                   context: context,
                                   initialDate: DateTime.now(),
                                   firstDate: DateTime.now(),
                                   lastDate: DateTime(DateTime.now().year + 10),
                                   builder: (BuildContext context, Widget? child) {
                                     return Theme(
                                       data: ThemeData.light().copyWith(
                                         colorScheme: ColorScheme.light().copyWith(
                                           primary: const Color(0xFF294B29), // Color of the selected date
                                         ),
                                       ),
                                       child: child!,
                                     );
                                   },
                                 );
                                 if (pickedDate != null) {
                                   // Update the text field value when a date is picked
                                   _dateTextEditingController.text =
                                       DateFormat('yyyy-MM-dd').format(pickedDate);
                                 }
                               },
                             ),
                           ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter a due date';
                             }
                             return null; // Return null if the input is valid.
                           },
                         ), SizedBox(height: 17,),

                         Container(
                           height: 45,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             color: const Color(
                                 0xFF294B29),
                           ),
                           child: MaterialButton(minWidth: double.infinity,
                             onPressed: () {
                               if (_formKey.currentState!.validate()) {
                                 saveuser.firstName=_firstnameextEditingController.text;
                                 saveuser.lastName=_lastnameTextEditingController.text;
                                 saveuser.email=_emailTextEditingController.text;
                                 saveuser.password=_passwordTextEditingController.text ;
                                 saveuser.password=_passwordTextEditingController.text;
                                 print(saveuser.password);
                                 print(saveuser.email);

                                 registerCubit.register(firstName: _firstnameextEditingController.text,
                                   lastName: _lastnameTextEditingController.text,
                                   email: _emailTextEditingController.text,
                                   password: _passwordTextEditingController.text,
                                   cPassword: _confirmpasswordTextEditingController.text,
                                   dueDate: _dateTextEditingController.text,
                                 );


                               }



                             },
                             padding: const EdgeInsets.only(right: 4, left: 4),
                             child: const Text('Continue', style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 20),),

                           ),),
                         const SizedBox(height: 26,)

                       ],
                     ),
                   ),
                 ],
               ),
             ),
           ),
         );
       }),






    );



  }




}