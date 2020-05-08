import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=2099c96f824fff353fd754dcf3150e2f');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      double temperature = data['main']['temp'];
      String cityName = data['name'];
      int condition = data['weather'][0]['id'];
    } else
      print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
