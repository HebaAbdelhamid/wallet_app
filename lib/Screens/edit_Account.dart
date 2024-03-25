import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit_Account extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return Edit_Account_State();
  }

}
class Edit_Account_State extends State<Edit_Account>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
         leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,size: 20,),
          color: Colors.black,

          onPressed: () {},),
        title: const Text(" Edit Profile",
          style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:150,vertical: 25),
              child: Stack(
                  children:[ CircleAvatar( radius:40,backgroundImage: AssetImage('images/5-512.webp'),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0,vertical: 35),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo_outlined)),
                  )
                  ]),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child:
              Column(
                children: [
                  buildContainerEditAccount('First Name',"Mohamed ",Icon(Icons.perm_identity_rounded)),SizedBox(height: 9,) ,
                  buildContainerEditAccount('Last Name',"Ahmed",Icon(Icons.perm_identity_rounded)),SizedBox(height: 9,) ,
                  buildContainerEditAccount('Email',"mohamed00@gmail.com ",Icon(Icons.email)),SizedBox(height: 9,) ,
                  buildContainerEditAccount('Password',"*********** ",Icon(Icons.visibility)),SizedBox(height: 9,) ,
                  buildContainerEditAccount('Due Date',"15 July 2024 ",Icon(Icons.visibility)),SizedBox(height: 9,) ,

                  Center(
                    child: TextButton(onPressed: (){
                      _dialogBuilder(context);
                    }, child: Text('Delete Account',style: TextStyle(color:Colors.red, fontSize: 17,decoration:TextDecoration.underline),)),
                  ),







                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainerEditAccount(String title,String text,Icon icon) {
    return
      Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(color: Color(0xffE9F0DE),borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.only(left: 17.0,top: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 icon,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(title,style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight:FontWeight.w500),),
                        Text(text,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight:FontWeight.w500),),
                    ]
            ),
                  ),
              Expanded(child: SizedBox()),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Color(0xFF294B29),)),

                ],
              ),
          )
          );
  }
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(''),
          content: Container(
            height: 300,
            child: Column(
              children: [
                Image.asset('images/9214793-removebg-preview 1.png',width: 200,height: 250,),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0,right: 38),
                  child: Column(
                    children: [
                      Text(
                        'Are you sure your want to ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'delete your account?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
          actions: <Widget>[
           /* Container(
              height: 45,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color:Colors.red
              ),
              child: MaterialButton(minWidth: double.infinity,
                onPressed: (){
                  // Navigator.of(context).push( MaterialPageRoute(builder: (context){return Register_Complete();}));
                },
                padding: const EdgeInsets.only(right: 4,left: 4),
                child: const Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

              ),),*/
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color:Colors.red
                ),
                child: MaterialButton(minWidth: double.infinity,
                  onPressed: (){
                    // Navigator.of(context).push( MaterialPageRoute(builder: (context){return Register_Complete();}));
                  },
                  padding: const EdgeInsets.only(right: 4,left: 4),
                  child: const Text('Yes,Delete',style: TextStyle(color: Colors.white,fontSize: 20),),

                ),),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color:Colors.white
                ),
                child: MaterialButton(minWidth: double.infinity,
                  onPressed: (){
                    Navigator.of(context).pop();

                  },
                  padding: const EdgeInsets.only(right: 4,left: 4),
                  child: const Text('Keep Account',style: TextStyle(color: Colors.black,fontSize: 20),),

                ),),
            ),

          ],
        );
      },
    );
  }
}