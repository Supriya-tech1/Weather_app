import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  String location;
  String temp = '';
  String humidity = '';
  String airspeed = '';
  String description = '';
  String main = '';

  Worker({required this.location});

  Future<void> getData() async {

    // Get data
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e66310cecfdeb654b3f2d40640b1592f"));

    Map data = jsonDecode(response.body);

    Map temp_data = data['main'];
    humidity = temp_data['humidity'].toString();
    temp = temp_data['temp'].toString();

    Map wind = data['wind'];
    airspeed = wind["speed"].toString();

    List weatherData = data['weather'];
    Map weatherMainData = weatherData[0];
    main = weatherMainData['main'];
    description = weatherMainData['description'];
  }
}