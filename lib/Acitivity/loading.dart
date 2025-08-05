import 'package:flutter/material.dart';
import 'package:mausam/Worker/worker.dart'; // Ensure 'Worker' class is correctly implemented

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? temp;
  String? hum;
  String? air_speed;
  String? description;
  String? main;

  void startApp() async {
    Worker instance = Worker(location: "Durgapur");
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.airspeed;
    description = instance.description;
    main = instance.main;

    Navigator.pushNamed(context, '/home', arguments: {
      "temp": temp,
      "humidity": hum,
      "airspeed": air_speed,
      "description": description,
      "main": main,
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
      body: SafeArea(
        child: Text("Loading"),
      ),
    );
  }
}