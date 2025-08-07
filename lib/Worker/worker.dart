import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  String location;
  String temp = '';
  String humidity = '';
  String airspeed = '';
  String description = '';
  String main = '';
  String icon = '';

  Worker({required this.location});

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(

          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e66310cecfdeb654b3f2d40640b1592f"));

      Map data = jsonDecode(response.body);

      print(data);

      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      Map wind = data['wind'];
      double getAir_sprrd = wind["speed"]/0.277778;

      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      main = weatherMainData['main'];
      description = weatherMainData['description'];



      temp = getTemp.toStringAsFixed(2);
      humidity = getHumidity;
      airspeed = getAir_sprrd.toStringAsFixed(2);
      icon = weatherMainData["icon"].toString();

    } catch (e) {
      temp = "Can't find Data";
      humidity = "Can't find Data";
      airspeed = "Can't find Data";
      main = "Can't find Data";
      icon = "04n";
    }
  }
}