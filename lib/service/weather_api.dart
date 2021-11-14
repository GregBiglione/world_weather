import 'package:world_weather/model/forecast_model.dart';
import 'package:world_weather/model/location_model.dart';
import 'package:world_weather/model/weather_model.dart';

abstract class WeatherApi {
  Future<Forecast> getWeather(Location location);
  Future<Location> getLocation(String city);
}