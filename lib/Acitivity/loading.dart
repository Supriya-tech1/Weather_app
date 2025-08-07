import 'package:flutter/material.dart';
import 'package:mausam/Worker/worker.dart'; // Ensure 'Worker' class is correctly implemented
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String? city = "Durgapur";
  String? temp;
  String? hum;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  void startApp() async {
    Worker instance = Worker(location: "city");
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.airspeed;
    description = instance.description;
    main = instance.main;
    icon = instance.icon;


    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushNamed(context, '/home', arguments: {
        "temp": temp,
        "humidity": hum,
        "airspeed": air_speed,
        "description": description,
        "main": main,
        "icon": icon,
        "city": city
      });

    });

  }

  @override
  void initState() {
    super.initState();
     startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60),
            Image.asset("images/Musam App logo.jpg", height: 350, width: 350),
            Text(
              "Mausam App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Made by Supriya",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 30),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}