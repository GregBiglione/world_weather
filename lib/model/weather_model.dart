enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  clear,
  mist,
  fog,
  lightCloud,
  heavyCloud,
  unknown,
}

class Weather {
  late String description;
  late double temperature;
  late String feelLikeTemperature;
  late int cloudiness;
  late WeatherCondition condition;
  late DateTime date;

  Weather({required this.description, required this.temperature, required this.feelLikeTemperature,
    required this.cloudiness, required this.condition, required this.date});

  //----------------------------------------------------------------------------
  //----------------------- Create Weather from JSON ---------------------------
  //----------------------------------------------------------------------------

  static Weather fromJson(dynamic json) {
    var cloudiness = json["clouds"];
    var weather = json["weather"][0];

    return Weather(
        description: weather["description"].toString(),
        temperature: json["temp"]["day"].toDouble(),
        feelLikeTemperature: json["feels_like"]["day"].toDouble(),
        cloudiness: cloudiness,
        condition: mapStringToWeatherCondition(weather["main"], cloudiness),
        date: DateTime.fromMicrosecondsSinceEpoch(json["dt"] * 1000, isUtc: true)
    );
  }

  //----------------------------------------------------------------------------
  //----------------------- Create map string weather condition ----------------
  //----------------------------------------------------------------------------

  static WeatherCondition mapStringToWeatherCondition(String input, int cloudiness) {
    WeatherCondition condition;

    switch(input) {
      case "Thunderstorm":
        condition = WeatherCondition.thunderstorm;
        break;
      case "Drizzle":
        condition = WeatherCondition.drizzle;
        break;
      case "Rain":
        condition = WeatherCondition.rain;
        break;
      case "Snow":
        condition = WeatherCondition.snow;
        break;
      case "Tornado":
        condition = WeatherCondition.atmosphere;
        break;
      case "Clear":
        condition = WeatherCondition.clear;
        break;
      case "Mist":
        condition = WeatherCondition.mist;
        break;
      case "Fog":
        condition = WeatherCondition.fog;
        break;
      case "Clouds":
        condition = cloudiness >= 85
        ? WeatherCondition.heavyCloud
        : WeatherCondition.lightCloud;
        break;
      case 'Smoke':
      case 'Haze':
      case 'Dust':
      case 'Sand':
      case 'Ash':
      case 'Squall':
      default:
        condition = WeatherCondition.unknown;
    }
    return condition;
  }
}