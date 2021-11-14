import 'package:world_weather/model/forecast_model.dart';
import 'package:world_weather/service/weather_api.dart';

class ForecastService {
  late final WeatherApi weatherApi;
  ForecastService(weatherApi); // TODO: Check if really usefull

  //----------------------------------------------------------------------------
  //----------------------- Get weather for a city -----------------------------
  //----------------------------------------------------------------------------

  Future<Forecast> getWeather(String city) async {
    final location = await weatherApi.getLocation(city);
    return await weatherApi.getWeather(location);
  }
}