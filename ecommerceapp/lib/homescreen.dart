import 'package:ecommerceapp/Searchpage.dart';
import 'package:ecommerceapp/checkout.dart';
import 'package:ecommerceapp/loginscreen.dart';
import 'package:ecommerceapp/productdetails.dart';
import 'package:ecommerceapp/wishlist.dart';
import 'package:flutter/material.dart';
class Homescreens extends StatefulWidget {
  const Homescreens({super.key});

  @override
  State<Homescreens> createState() => _HomescreensState();
}

class _HomescreensState extends State<Homescreens> {
  
  int _selectedIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    homescreen(),
    wishlist(),// Replace with your other screens
  Productdetails(),
  Searchpage(),
  
  profilescreen(),
  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return Scaffold(

      body:_screens[_selectedIndex],
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0 ? Colors.red : Colors.black),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.favorite,
                  color: _selectedIndex == 1 ? Colors.red : Colors.black),
              onPressed: () => _onItemTapped(1),
            ),
            SizedBox(width: 40), // Space for FAB
            IconButton(
              icon: Icon(Icons.search,
                  color: _selectedIndex == 3 ? Colors.red : Colors.black),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(Icons.settings,
                  color: _selectedIndex == 4 ? Colors.red : Colors.black),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),

           floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.white,
        onPressed: () {
          _onItemTapped(2);
        }, // Dummy action for FAB
        child: Icon(Icons.shopping_cart,

        color: _selectedIndex == 2 ? Colors.red : Colors.black),),
        backgroundColor: Colors.white,
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
      
    
    
  }
}
class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final ScrollController _scrollController = ScrollController();

  final List<Map<String,String>> items = [
    {
      "image": "https://www.urbanwardrobe.in/cdn/shop/products/Peach1.jpg?v=1598977466", // Kurta
      "title": "Women Printed Kurta",
      "price": "₹1500",
      "discount": "40% Off"
    },
    {
      "image": "https://rukminim3.flixcart.com/image/750/900/xif0q/shoe/w/4/2/-original-imah23cbpbznvcqa.jpeg?q=20&crop=false", // Shoes
      "title": "HRX by Hrithik Roshan",
      "price": "₹2499",
      "discount": "50% Off"
    },
    {
      "image": "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/8cc40f5a-3693-4976-9ce0-70ec9687889b/WMNS+AIR+MAX+90.png", // Nike Shoes
      "title": "Nike Air Max",
      "price": "₹3999",
      "discount": "30% Off"
    },
    {
      "image": "https://images.bewakoof.com/t540/men-s-black-hoodies-596543-1733410420-1.jpg", // Nike Shoes
      "title": "Winter Hoodie",
      "price": "₹5999",
      "discount": "60% Off"
    },
    {
      "image": "https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/29920536/2024/7/8/a289b4b0-052c-423c-bcce-18dc409f59ae1720434358553-DressBerry-Women-Dresses-8541720434358093-1.jpg", // Nike Shoes
      "title": "Flare dress",
      "price": "₹8999",
      "discount": "70% Off"
    },
    
    {
      "image": "https://nightcityclothing.com/cdn/shop/products/A80I4074.jpg", // Nike Shoes
      "title": "Oversize coat",
      "price": "₹8999",
      "discount": "90% Off"
    }

  ];

  void _scrollNext() {
    _scrollController.animateTo(
      _scrollController.offset + 200, // Move right by 200 pixels
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {

    final Size=MediaQuery.of(context).size;
    return Scaffold(
      
      
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                  }, icon: Icon(Icons.arrow_back)),
                  SizedBox(width: Size.width*0.15,),
                  Image.asset('assets/click.png',
                  scale: 4,),
                  SizedBox(width: Size.width*0.05,),
                  CircleAvatar(backgroundImage: NetworkImage('https://flutterx.com/thumbnails/artifact-2096.png'),
                  radius: 18,)
                ],
              ),
              Padding(
                padding:EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search any products',
                  suffixIcon: Icon(Icons.mic),
        
                ),
              ),
              ),
              Text('All Featured'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                  CircleAvatar(backgroundImage: NetworkImage('https://burst.shopifycdn.com/photos/makeup-beauty-flatlay.jpg?width=1000&format=pjpg&exif=0&iptc=0'),),
                    Text('Beauty'),
                    ],
                  ),
                  SizedBox(width: Size.width*0.08,),
                  Column(
                    children: [
                  CircleAvatar(backgroundImage: NetworkImage('https://i.pinimg.com/564x/f9/43/56/f94356c21ba885f1c247b1aeaadcbfdc.jpg'),),
                    Text('Fashion')
                    ],
                  ),
                  SizedBox(width: Size.width*0.08,),
                  Column(
                    children:[ 
                    CircleAvatar(backgroundImage: NetworkImage('https://m.media-amazon.com/images/I/617eGIvrPYL._AC_UY1100_.jpg'),
                  ),
                  Text('Kids'),
                    ],
                  ),
                  
                  SizedBox(width: Size.width*0.08,),
                  Column(
                    children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>wishlist()));
                    },
                    child: CircleAvatar(backgroundImage: NetworkImage('https://tigc.in/cdn/shop/files/compress_0123-shydch-31-blue__1.jpg?v=1720763814'),),
                  ),
                  Text('Men')
                    ],
                  ),
                  SizedBox(width: Size.width*0.08,),
                  Column(
                    children: [

                  CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSicIRqFLfYvKbpxc8noAWSys0-RlavMC_q-A&s'),),
                    Text('Women')
                    ],
                  ),
                ],
              ),
              
              Image(image: AssetImage('assets/disc.png',
              
              
              ),
              height:300,
              width:double.infinity,

              
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox (width: Size.width*0.03,),
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 180,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Card(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                              child: Image.network(
                                items[index]["image"]!,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]["title"]!,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: Size.height*0.02),
                                  Text(items[index]["price"]!,
                                      style: TextStyle(fontSize: 14, color: Colors.black)),
                                  Text(items[index]["discount"]!,
                                      style: TextStyle(fontSize: 12, color: Colors.red)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                            ),
              ),
          
          ElevatedButton(
            onPressed: _scrollNext,
            child: Icon(Icons.arrow_forward),
          ),
          
           Image(image: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/617/573/non_2x/summer-sale-offer-banner-promotion-podium-display-product-with-orange-background-vector.jpg'),
              height:250,
              width:800,

              
              ),
        ],
      ),

        
            
            
          ),
        ),
    );
  }
}