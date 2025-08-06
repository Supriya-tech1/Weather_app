import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Durgapur", "Samastipur" ,"London", "Kolkata"];
    var final_random = new Random();
    var city = city_name[final_random.nextInt(city_name.length)];
    final route = ModalRoute.of(context);
    if (route == null || route.settings.arguments == null) {
      return Scaffold(
        body: Center(child: Text("No data passed")),
      );
    }

    final Map info = route.settings.arguments as Map;

    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,

                colors:
                  [
                    Colors.blue.shade800,
                    Colors.blue.shade300,
                  ]
              )

            ),
            child: Column(
              children: [
                Container(

                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 14,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Search Me");
                        },
                        child: Container(child: Icon(Icons.search,color: Colors.blueAccent,),margin: EdgeInsets.fromLTRB(3, 0, 7, 0),),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city"
                          ),

                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            
          ) 
    ),
    );
  }
}
