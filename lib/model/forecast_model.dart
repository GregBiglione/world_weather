import 'package:world_weather/model/weather_model.dart';

class Forecast {
  late String city;
  late double lat;
  late double lng;
  late List<dynamic> daily;
  late Weather currentWeather;
  late DateTime lastUpdate;
  late bool isDayTime;

  Forecast({required this.city, required this.lat, required this.lng, this.daily = const [], required this.currentWeather,
    required this.lastUpdate, required this.isDayTime});

  //----------------------------------------------------------------------------
  //----------------------- Create Forecast from JSON --------------------------
  //----------------------------------------------------------------------------

  static Forecast fromJson(dynamic json) {
    var weather = json["current"]["weather"][0];
    var date = DateTime.fromMicrosecondsSinceEpoch(json["current"]["dt"] * 1000, isUtc: true);
    var sunrise = DateTime.fromMicrosecondsSinceEpoch(json["current"]["sunrise"] * 1000, isUtc: true);
    var sunset = DateTime.fromMicrosecondsSinceEpoch(json["current"]["sunset"] * 1000, isUtc: true);
    bool isDay = date.isAfter(sunrise) && date.isBefore(sunset);
    var cloudiness = int.parse(json["current"]["clouds"].toString());

  //----------------------------------------------------------------------------
  //----------------------- Get 3 next days forecast ---------------------------
  //----------------------------------------------------------------------------

  bool hasDaily = json["daily"] != null;
  var dailyWeather = [];

  if(hasDaily) {
    List items = json["daily"];
    dailyWeather = items
        .map((item) => Weather.fromJson(item))
        .toList()
        .skip(1)
        .take(3)
        .toList();
  }

    var currentWeather = Weather(
        description: weather["description"].toString(),
        temperature: json["current"]["temp"].toDouble(),
        feelLikeTemperature: json["current"]["feels_like"].toDouble(),
        cloudiness: cloudiness,
        condition: Weather.mapStringToWeatherCondition(weather["main"], cloudiness),
        date: date
    );

    return Forecast(
        city: json["timezone"].toString(), //TODO check this is good for city:
        lat: json["lat"].toDouble(),
        lng: json["lon"].toDouble(),
        daily: dailyWeather,
        currentWeather: currentWeather,
        lastUpdate: DateTime.now(),
        isDayTime: isDay
    );
  }
}