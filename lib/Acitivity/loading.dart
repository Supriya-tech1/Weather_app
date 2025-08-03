import 'package:flutter/material.dart';
import 'package:mausam/Worker/worker.dart'; // Ensure 'Worker' class is correctly implemented

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String Temperature = "Loading";

  void startApp() async {
    Worker instance = Worker(location: "durgapur");
    await instance.getData();
    setState(() {
      Temperature = instance.temp;
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
        child: Column(
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              icon: Icon(Icons.add_to_home_screen),
              label: Text(Temperature),
            ),
          ],
        ),
      ),
    );
  }
}