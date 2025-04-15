import 'package:ecommerceapp/RoundButton.dart';
import 'package:ecommerceapp/Signupscreen.dart';
import 'package:ecommerceapp/fluttertoast.dart';
import 'package:ecommerceapp/forgotpassword.dart';
import 'package:ecommerceapp/getstarted.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  final _formKey=GlobalKey<FormState>();
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  final _auth=FirebaseAuth.instance;
  bool loading=false;
  bool _obscureText=true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
  
  
 
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
      child:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: Size.height*0.1,),
              Text('Welcome Back!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: Size.height*0.05,),
              
                
                 Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value){
                    if(value!.isEmpty){
                      return 'Enter email';
                    }
                    else if( !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)){
                      return 'Enter valid email address';
                    }
                    else{
                      return null;
                    }
                  },
                  ),
                ),
              
              
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: passwordcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility, 
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText; // Toggle visibility
                      });
                    },
                  
                
              ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter password';
                    }
                    else if( value.length<6){
                      return 'Password must be atleast 6 characters';
                    }
                    else{
                      return null;
                    }
                  },
                ),
              ),
              
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                  },
                   child: Text('Forgot Password?'),
                   ),
              ),
              SizedBox(height: Size.height*0.05,),
              RoundButton(
                title: 'Login',
                loading: loading,
                 onTap: (){
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      loading=true;
                    });
                    _auth.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text.toString()).then((value){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Getstarted()));
                    }
                    ).onError((error,stacktrace){
                      Utils().toastMessage(error.toString());
                      setState(() {
                        loading=false;
                      });
                    });
                  }
          
                 }
                ),
                SizedBox(height: Size.height*0.2,),
              Text('--OR Continue with--'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.google)),
                  SizedBox(width: Size.width*0.03,),
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.github)),
                  SizedBox(width: Size.width*0.03,),
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.facebook)),
                ],
              ),
              SizedBox(height: Size.height*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Create An Account'),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signupscreen()));
                    }, 
                    child: Text('Sign Up',
                    style: TextStyle(
                      fontSize: 15,
                    ),)
                    )
          
                ],
              )
          
          
          
            ],
          ),
        ),
      ),
      ),
    );
  }
}