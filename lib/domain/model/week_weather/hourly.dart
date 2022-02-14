import 'weather.dart';

class Hourly {
  final int hour;
  final num temp;
  final num feelsLike;
  final num pressure;
  final num humidity;
  final num dewPoint;
  final num uvi;
  final num clouds;
  final num visibility;
  final num windSpeed;
  final num windDeg;
  final num windGust;
  final Weather weather;
  final num pop;

  Hourly({
    required this.hour,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.weather,
    required this.windDeg,
    required this.windSpeed,
    required this.windGust,
    required this.pop,
  });
}
