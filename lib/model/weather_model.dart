enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  clear,
  mist,
  lightCloud,
  heavyCloud,
  unknown,
}

class Weather {
  late String description;
  late double temperature;
  late String fellLikeTemperature;
  late int cloudiness;
  late WeatherCondition condition;
  late DateTime date;

  Weather({required this.description, required this.temperature, required this.fellLikeTemperature,
    required this.cloudiness, required this.condition, required this.date});
}