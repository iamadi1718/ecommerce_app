import 'package:ecommerceapp/RoundButton.dart';
import 'package:ecommerceapp/fluttertoast.dart';
import 'package:ecommerceapp/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  @override
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  final confirmpasswordcontroller=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  final _auth=FirebaseAuth.instance;
  bool loading=false;
   bool _obscureText = true;
   bool _obscureTexts=true;
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
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              children: [
                SizedBox(height: Size.height*0.1,),
                Text('Create an account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: Size.height*0.05,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
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
                      controller: passwordcontroller,
                      obscureText: _obscureText,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
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
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: confirmpasswordcontroller,
                      obscureText: _obscureTexts,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility, 
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTexts = !_obscureTexts; // Toggle visibility
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
                      else if(passwordcontroller.text.toString()!=confirmpasswordcontroller.text.toString()){
                        return "Password does not match";
                      }
                      else{
                        return null;
                      }
                    },
                    ),
                  ),
                    ],
                  ),
                ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (){},
                       child: Text('Forgot Password?'),
                       ),
                  ),
                  SizedBox(height: Size.height*0.05,),
                  RoundButton(
                    title: 'Create Account',
                    loading: loading,
                     onTap: (){
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          loading = true;
                        });
                      }
                      _auth.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text.toString()).then((value){
                        setState(() {
                        
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                        });
                        
                      }).onError((error,stacktrace){
                        Utils().toastMessage(error.toString());
                        setState(() {
                          loading=false;
                          
                        });
                      });
                     }
                     
                    ),
                    SizedBox(height: Size.height*0.1,),
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
                      Text('I already have Account'),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                        }, 
                        child: Text('Login',
                        style: TextStyle(
                          fontSize: 15,
                        ),)
                        )
                          
                    ],
                  )
                          
                          
                          
                            ,
                ],
            ),
        ),
      ),
      
    );
  }
}