import 'package:ecommerceapp/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:readmore_flutter/readmore_flutter.dart';
class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  String buttonText = "Add to Cart";

  void changeText() {
    setState(() {
      buttonText = "Added to Cart";
    });
  }
  
  @override
  final List<String>list=[
    '6UK','7UK','8K','9K'

  ];
  int selectedIndex = -1;
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Background color
        elevation: 0, // Removes shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back button
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black), // Cart icon
            onPressed: () {
              // Navigate to cart page or any action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
             
              width: double.infinity,
              height: 300,
              child: Image.network('https://static.nbastore.in/resized/500X500/777/jordan-stay-loyal-3-sneakers-whiteblackgym-red-white-67a856910713f.png',
              fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: Size.height*0.04,),
            Text(
            selectedIndex == -1
                ? 'Select an item'
                : list[selectedIndex],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 10,
            children:
            List.generate(list.length, (index) {
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                    
                  });
                },
                child: Text( list[index]),
              );
            }),
            
            ),
            SizedBox(height: Size.height*0.02,),
            Align(
              alignment: Alignment.topLeft,
              child: Text('\t\tJordan Stay',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('\t\t\tVision Alta Men’s Shoes Size (All Colours)',
              style: TextStyle(
                fontSize: 15,
              ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: RatingBarIndicator(
              rating: 4.5, // 4.5 Star Rating
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0, // Size of stars
              direction: Axis.horizontal,
                        ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: Size.width*0.05,),
              Text('\t\t\$2999',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 18,
                color: Colors.grey,
              ),),
              SizedBox(width: Size.width*0.05,),
              Text('\$1500',
              style: TextStyle(
                fontSize: 18,
              ),),
              SizedBox(width: Size.width*0.05,),
              Text('50% off',
              style: TextStyle(
                color: Colors.pink,
              ),),


            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('  Product Details',
            style: TextStyle(
            fontSize: 18,
          ),)),
          ReadMoreText(
              "Perhaps the most iconic sneaker of all-time, this original Chicago? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More",
          trimLines: 4,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read More',
          trimExpandedText: 'Read Less',
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.lightBlueAccent,
                ),
              label: Text(buttonText),
                onPressed: (){
                  changeText();

                }, 
                icon: Icon(Icons.shopping_cart)
                ),
                SizedBox(width: Size.width*0.05,),
                ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.greenAccent,
                ),
                
              label: Text('Buy Now',),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>profilescreen()));
                }, 
                icon: FaIcon(FontAwesomeIcons.bullseye),
                ),
            ],
          )
          ],   
        ),
      ),
    );
  }
  
}