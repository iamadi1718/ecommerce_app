import 'dart:async';

import 'package:ecommerceapp/getstarted.dart';
import 'package:ecommerceapp/homescreen.dart';
import 'package:ecommerceapp/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  SplashServices Splashscreen=new SplashServices();
  @override
  void initState() {
    Splashscreen.islogin(context);
    super.initState();
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage(('assets/click.png'),)
      ),
      ),
      
    );
  }
}
class SplashServices{
  void islogin(BuildContext context){
    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user!=null){
    Timer(Duration(seconds: 1),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreens()));
    
    });
    }
    else{
      Timer(Duration(seconds: 1),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
    
    });
      
    }
    
  
}
}
