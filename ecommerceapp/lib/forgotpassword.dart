import 'package:ecommerceapp/RoundButton.dart';
import 'package:ecommerceapp/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  final emailcontroller=TextEditingController();
  final auth=FirebaseAuth.instance;
   
  
  
 
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: Size.height*0.05,),
            Text('Forgot Password?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: Size.height*0.08,),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email address',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: Size.height*0.05,),
            RoundButton(title: 'Forgot', onTap: (){
              auth.sendPasswordResetEmail(email: emailcontroller.text.toString()).then((value){
                 
                Utils().toastMessage('We have sent you email to recover your password');
                
        
              }).onError((error,stackTrace){
                    Utils().toastMessage(error.toString());
              });
            }),
        
              ],
            ),
      )



        
      );
    
  }
}