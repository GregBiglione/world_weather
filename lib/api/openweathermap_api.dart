import 'dart:convert';

import 'package:world_weather/model/forecast_model.dart';
import 'package:world_weather/model/location_model.dart';
import 'package:world_weather/service/weather_api.dart';
import 'package:http/http.dart' as http;

class OpenWeatherMapApi extends WeatherApi {
  static const baseUrl = "https://api.openweathermap.org/data/2.5";
  static const apiKey = "";
  late http.Client httpClient;

  OpenWeatherMapApi(){
    httpClient = http.Client(); //TODO: Check if OpenWeatherMapApi() can be deleted. And replace see l 25
  }

  //----------------------------------------------------------------------------
  //----------------------- Get location ---------------------------------------
  //----------------------------------------------------------------------------

  @override
  Future<Location> getLocation(String city) async {
    final requestUrl = "$baseUrl/weather?q=$city&APPID=$apiKey";
    final response = await httpClient.get(Uri.parse(requestUrl)); //TODO: http.Response response = await http.get()... ?
    // TODO: Check if Uri.encodeFull(requestUrl) instead of Uri.parse
    if(response.statusCode != 200) {
      throw Exception("Error retrieving location for city $city: ${response.statusCode}");
    }
    return Location.fromJson(jsonDecode(response.body));
  }

  //----------------------------------------------------------------------------
  //----------------------- Get weather ----------------------------------------
  //----------------------------------------------------------------------------

  @override
  Future<Forecast> getWeather(Location location) async {
    final requestUrl = "$baseUrl/onecall?lat=${location.lat}&lon=${location.lng}&exclude=hourly,minutely&APPID=$apiKey";
    final response = await httpClient.get(Uri.parse(requestUrl)); //TODO: http.Response response = await http.get()... ?
    // TODO: Check if Uri.encodeFull(requestUrl) instead of Uri.parse
    if (response.statusCode != 200) {
      throw Exception("Error retrieving weather for location $location: ${response.statusCode}");
    }
    return Forecast.fromJson(response.body);
  }
}