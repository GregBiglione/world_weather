import 'package:flutter/material.dart';
import 'package:world_weather/view/home_view.dart';

void main() {
  runApp(const WorldWeather());
}

class WorldWeather extends StatelessWidget {
  const WorldWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'World Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
