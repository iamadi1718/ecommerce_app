import 'package:ecommerceapp/RoundButton.dart';
import 'package:ecommerceapp/placeorder.dart';
import 'package:flutter/material.dart';
class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(backgroundImage: NetworkImage('https://flutterx.com/thumbnails/artifact-2096.png'),
                    radius: 50,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        color: Colors.blue,
                        child: Icon(
                        Icons.edit,
                        size: 26,
                        color: Colors.white, // Edit icon color
                                        ),
                      ),
                    ),),
              Align(
                alignment: Alignment.topLeft,
                child: Text(' Personal Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),),
              ),
              SizedBox(height: Size.height*0.02,),
              Text('Email'),
              TextFormField(
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'aashifa@gmail.com',
                  labelText: 'Email',
                  
                )
              ),
              SizedBox(height: Size.height*0.02,),
              Text('Password'),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'Password',
                  
                )
              ),
              SizedBox(height: Size.height*0.02,),
              Divider(thickness: 2,),
              SizedBox(height: Size.height*0.02,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(' Business Address Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),),
              ),
              SizedBox(height: Size.height*0.02,),
              Text('Pincode'),
              TextFormField(
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PinCode',
                 
                  
                )
              ),
              SizedBox(height: Size.height*0.02,),
              Text('Address'),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'Address',
                  hintText: '216 St Paul Road',
                  
                )
              ),
              SizedBox(height: Size.height*0.02,),
              Text('City'),
              TextFormField(
                
              
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'City',
                  hintText: 'London',
                  
                )
              ),
              Text('Country'),
              TextFormField(
                
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'Country',
                  hintText: 'United Kingdom',
                  
                )
              ),
              SizedBox(height: Size.height*0.02,),
              Divider(thickness: 2,),
              SizedBox(height: Size.height*0.02,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(' Business Address Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),),
              ),
              SizedBox(height: Size.height*0.02,),
              Text('Pincode'),
              TextFormField(
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PinCode',
                 
                  
                )
              ),
              SizedBox(height: Size.height*0.02,),
              Text('Bank Account Number'),
        
              TextFormField(
                
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'Bank Account Number',
                  hintText: '216 St Paul Road',
                  
                )
              ),
              SizedBox(height: Size.height*0.02,),
              Text('Account Holder Name'),
              TextFormField(
                
              
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'Account Holder name',
                  hintText: 'Aditya Kashyap',
                  
                )
              ),
              SizedBox(height: Size.height*0.02,),
              Text('IFSC Code'),
              TextFormField(
                
                
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'IFSC code',
                  
                  
                )
              ),
              SizedBox(height: Size.height*0.02,),
              RoundButton(title: 'Save', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceorderScreen()));
              })
        
            ],
          ),
        ),
      ),
    );
  }
}