import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  late String city;

  @override
  void initState() {
    super.initState();
    print("This is a init state");
    var city_name = ["Mumbai", "Durgapur", "Samastipur", "London", "Kolkata"];
    var final_random = Random();
    city = city_name[final_random.nextInt(city_name.length)];
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
    final route = ModalRoute.of(context);

    if (route == null || route.settings.arguments == null) {
      return Scaffold(
        body: Center(child: Text("No data passed")),
      );
    }

    final Map info = route.settings.arguments as Map;
    String temp = ((info['temp']).toString());
    String airspeed = ((info['airspeed']).toString());
    if (temp == "NA") {
      print("NA");
    } else {
      temp = ((info['temp']).toString()).substring(0, 4);
      airspeed = ((info['airspeed']).toString()).substring(0, 4);
    }
    String icon = info['icon'];
    String city = info['city'];
    String humidity = info['humidity'];
    String description = info['description'];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade300,
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll("  ", " ") ==
                              "") {
                            print("Blank search");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "searchText": searchController.text,
                                });
                          }
                        },
                        child: Container(
                          child: Icon(Icons.search, color: Colors.blueAccent),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  "$description",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "In $city",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$temp",
                                  style: TextStyle(fontSize: 70),
                                ),
                                Text(
                                  "C",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              "$airspeed",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("km/hr"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              "$humidity",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("Percent"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 130,),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by Supriya"),
                      Text("Data Provided By Openweathermap.org"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}