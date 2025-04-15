import 'package:ecommerceapp/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class wishlist extends StatefulWidget {
  const wishlist({super.key});

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  final List<Map<String,dynamic>>list=[
    {
    "image":"https://5.imimg.com/data5/SELLER/Default/2021/3/GD/WQ/LL/61224107/winter-hoodie-500x500.jpg",
    "title":"Black Winter..",
    
    "price":"₹499",
    

    },
    {
    "image":"https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/30138798/2024/7/6/5d2f904b-c0c2-4073-8607-c821d181daef1720247469840MyDesignationMenFloralOpaquePrintedCasualShirt1.jpg",
    "title":"Mens Starry",
    
    "price":"₹399",
   

    },
    {
    "image":"https://assets.ajio.com/medias/sys_master/root/20240115/afuc/65a4f2678cdf1e0df5b467c8/-473Wx593H-466977059-black-MODEL.jpg",
    "title":"Black Dress",
   
    "price":"₹2000",
    

    },
    
    {
    "image":"https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/2b7d5f22-3911-46e9-8678-866166b54c98/JORDAN+STAY+LOYAL+3+%28GS%29.png",
    "title":"Jordan Stay",
    
    "price":"₹4999",
    

    },
    {
    "image":"https://static.realme.net/v2/realme-7-5g/images/specs/blue-bg-e18b018da4.png",
    "title":"Realme7",
    
    "price":"₹3499",
    

    },
    {
    "image":"https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/8081687/2022/12/5/76ffb629-88de-4497-9b85-3b5c50b85e0f1670216568404-High-Star-Men-Black-Solid-Denim-Jacket-6541670216567762-1.jpg",
    "title":"Black Jacket",
    
    "price":"₹2999",
    

    },
    {
    "image":"https://5.imimg.com/data5/HB/QY/HY/SELLER-70259856/muscleblaze-whey-performance-70-protein-500x500.jpg",
    "title":"MuscleBlaze",
    
    "price":"₹2999",
    

    },
    {
    "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZMVmyS-MIpwBRpLPjlPjqnTNVnGXq-zl-Zg&s",
    "title":"Hot Chocolate",
 
    "price":"₹200",
    

    },

  ];
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
                  Icon(Icons.menu),
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
              SizedBox(height: Size.height*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' 52,082+ Items',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: Size.width*0.03,),
                  ElevatedButton.icon(
                    label: Text('Sort'),
                    
                    icon: Icon(Icons.keyboard_double_arrow_up_rounded,),
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      
                    )
                    
                    ),
                    SizedBox(width: Size.width*0.03,),
                    ElevatedButton.icon(
                    label: Text('Filter'),
                    icon: FaIcon(FontAwesomeIcons.filter),
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    )
                    
                    ),
                ],
              ),
              GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 7,
                ),
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                shrinkWrap: true,
              
                
                itemBuilder: (context,index){
                  return  InkWell(
                    onTap:(){
                       index==3?Navigator.push(context,MaterialPageRoute(builder: (context)=>Productdetails())):Placeholder();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      
                      
                      decoration: BoxDecoration(
                      boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            
                          )
                        ],
                      ),
                      
                      child: Card(
                        
                        
                          child: Column(
                            children: [
                              Image.network( list[index]["image"]!,
                              width: double.infinity,
                              height: 150,
                                  fit: BoxFit.cover,
                              ),
                              Text(list[index]["title"]!,style: TextStyle(fontWeight: FontWeight.bold),),
                              
                              Text(list[index]["price"]!),
                              
                          
                          
                            ],
                          ),
                        ),
                      ),
                    
                  );
              
                }
                
                 
              
                
                )
            ],
          )
        ),
      ),

    );
  }
}