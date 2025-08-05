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
    final route = ModalRoute.of(context);
    if (route == null || route.settings.arguments == null) {
      return Scaffold(
        body: Center(child: Text("No data passed")),
      );
    }

    final Map info = route.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),
      ),
      body: Column(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {},
          ),
          Text("temperature: ${info["temp"]} °C"),
          Text("humidity: ${info["humidity"]} %"),
          Text("Wind Speed: ${info["airspeed"]} km/h"),
          Text("Weather: ${info["main"]}"),
          Text("Description: ${info["description"]}"),
        ],
      ),
    );
  }
}
