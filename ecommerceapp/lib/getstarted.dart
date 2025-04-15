import 'package:ecommerceapp/RoundButton.dart';
import 'package:ecommerceapp/homescreen.dart';
import 'package:flutter/material.dart';
class Getstarted extends StatefulWidget {
  const Getstarted({super.key});

  @override
  State<Getstarted> createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  @override
  
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/get.png',),
            
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Size.height*0.6,),
            Text('You want\nAuthentic, here\n      you go!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: Size.height*0.02,),
            Text('Find it here,buy it now',
            style: TextStyle(
              color: Colors.grey,
            ),),
            SizedBox(height: Size.height*0.05,),
            Padding(
              padding: EdgeInsets.all(20),
              child: RoundButton(title: 'Get Started', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreens()));
              }),
            )
          ],
      
      
        ),
      ),
    );
  }
}