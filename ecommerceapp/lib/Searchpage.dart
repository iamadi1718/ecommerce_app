import 'package:flutter/material.dart';
class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(' Recently Viewed',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),)),
            ],
          ),
        ),
      ),
    );
  }
}