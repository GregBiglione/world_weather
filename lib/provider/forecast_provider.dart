import 'package:flutter/material.dart';
import 'package:world_weather/api/openweathermap_api.dart';
import 'package:world_weather/model/weather_model.dart';
import 'package:world_weather/service/forecast_service.dart';

class ForecastProvider extends ChangeNotifier {
  bool isRequestPending = false;
  bool isWeatherLoaded = false;
  bool isRequestError = false;

  late WeatherCondition _weatherCondition;
  late String _description;
  late double _minTemperature;
  late double _maxTemperature;
  late double _temperature;
  late double _feelLike;
  late int _locationId;
  late DateTime _lastUpdated;
  late String _city;
  late double _lat;
  late double _lng;
  late List<Weather> _daily;
  late bool _isDayTime;
  late ForecastService forecastService;

  WeatherCondition get weatherCondition => _weatherCondition;
  String get description => _description;
  double get minTemperature => _minTemperature;
  double get maxTemperature => _maxTemperature;
  double get temperature => _temperature;
  double get feelLike => _feelLike;
  int get locationId => _locationId;
  DateTime get lastUpdated => _lastUpdated;
  String get city => _city;
  double get lat => _lat;
  double get lng => _lng;
  List<Weather> get daily => _daily;
  bool get isDayTime => _isDayTime;

  ForecastProvider() {
    forecastService = ForecastService(OpenWeatherMapApi());
  }

  //----------------------------------------------------------------------------
  //----------------------- Get weather ----------------------------------------
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  //----------------------- Update forecast weather ----------------------------
  //----------------------------------------------------------------------------
}