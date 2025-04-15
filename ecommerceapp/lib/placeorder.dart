import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/RoundButton.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class PlaceorderScreen extends StatefulWidget {
  const PlaceorderScreen({super.key});

  @override
  PlaceorderScreenState createState() => PlaceorderScreenState();
}

class PlaceorderScreenState extends State<PlaceorderScreen> {
  int size = 6;
  int quantity = 1;
  double basePrice = 7000.0;
  double discount = 0.0;
  String couponCode = "";
   double get totalPrice => (( size > 1 ? basePrice *(size - 5): basePrice) * quantity).toDouble();


 double get discountPrice => (( size > 1 ? basePrice *(size - 5): basePrice) * quantity * (1 - discount)).toDouble();

  void applyCoupon() async {
    TextEditingController couponController = TextEditingController();
    await showDialog(
      
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          width: 500,
          child: AlertDialog(
            
            
            title: Text("Enter Coupon Code"),
            content: TextField(
              controller: couponController,
              decoration: InputDecoration(hintText: "Coupon Code",
              border: OutlineInputBorder()),
            ),
            actions: [
              Column(children: [ 
                Text('Coupon code'),
                Text('DISCOUNT10',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),)
            ]),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    couponCode = couponController.text.trim().toUpperCase();
                    if (couponCode == "DISCOUNT10") {
                      discount = 0.1; // 10% discount
                    } else {
                      discount = 0.0;
                    }
                  });
                  Navigator.of(context).pop();
                },
                child: Text("Apply"),
              ),
            ],
          ),
        );
      },
    );
  }
  Razorpay _razorpay=Razorpay();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
_razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    DateTime now = DateTime.now(); // Get current date and time
    String formattedDate = DateFormat("d MMM y").format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Bag"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 123,
                    height: 153,
                    color: Colors.grey.shade300,
                    child: Image.network('https://assets.ajio.com/medias/sys_master/root/20240710/AHNA/668e9e551d763220fa50685f/-473Wx593H-469647423-white-MODEL4.jpg',
                    fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Jordan Stay", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                       
                        Row(
                          children: [
                            DropdownButton<int>(
                              value: size,
                              onChanged: (newValue) {
                                setState(() {
                                  size = newValue!;
                                });
                              },
                              items: [6, 7, 8,9,10,11,12,13].map((e) => DropdownMenuItem(value: e, child: Text("Size $e"))).toList(),
                            ),
                            SizedBox(width: 50),
                            DropdownButton<int>(
                              value: quantity,
                              onChanged: (newValue) {
                                setState(() {
                                  quantity = newValue!;
                                });
                              },
                              items: [1, 2, 3, 4, 5].map((e) => DropdownMenuItem(value: e, child: Text("Qty $e"))).toList(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text('Delivered by $formattedDate'),
                      ],
                    ),
                  )
                ],
              ),
              
              SizedBox(height: 40),
              GestureDetector(
                onTap: applyCoupon,
                child: Row(
                  children: [
                    Icon(Icons.local_offer, color: Colors.red),
                    SizedBox(width: 10),
                     Text(
        couponCode.isNotEmpty ? "Coupon Applied" : "Apply Coupons",
        style: TextStyle(
          color: couponCode.isNotEmpty ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Divider(),
              Text("Order Payment Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Order Amount"),
                  
                  Text("₹ ${totalPrice.toStringAsFixed(2)}.", style: TextStyle(fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough)),
                
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discount Percentage"),
                  Text(couponCode.isNotEmpty?"10%":"0.0"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Discount Amounts"),
                  
                  Text("₹ ${discountPrice.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold)),
                
                ],
              ),
              SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Fee"),
                  Text("Free", style: TextStyle(color: Colors.green)),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Total", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("₹ ${discountPrice.toStringAsFixed(2)}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('EMI available'),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Text('Details',
                    style: TextStyle(
                      color: Colors.pink,
                    ),),
                  )
                ],
              ),
              SizedBox(height: 50,),
              Divider(thickness: 2,),
              SizedBox(height: 40,),
              
                    RoundButton(
                      title: 'Proceed to Payment',
                       onTap: () {
                     var options = {
  'key': 'rzp_test_EHqaLn3xRZ2BT1',
  'amount':(totalPrice * 100).toInt(),
  'name': 'Jordan Stay',

  
  'prefill': {
    'contact': '8799741295',
    'email': 'test@razorpay.com'
  }
  ,
  'theme': {
    'color': '#800080', 
    
  }
};
_razorpay.open(options);
                     
                    })
                
                  ],
                ),
              
              
            
          ),
        ),
      
    );
  }
   void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment success");
  
}

void _handlePaymentError(PaymentFailureResponse response) {
  Fluttertoast.showToast(msg: "Payment failed");
}

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    try{
    _razorpay.clear();
    }
    catch(e){
      print(e);
    }
  }
}


