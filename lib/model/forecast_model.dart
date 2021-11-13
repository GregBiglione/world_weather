import 'package:world_weather/model/weather_model.dart';

class Forecast {
  late String city;
  late double lat;
  late double lng;
  late List<Weather> daily;
  late Weather currentWeather;
  late DateTime lastUpdate;
  late bool isDayTime;

  Forecast({required this.city, required this.lat, required this.lng, required this.daily, required this.currentWeather,
    required this.lastUpdate, required this.isDayTime});
}