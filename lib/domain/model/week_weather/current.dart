import 'weather.dart';

class Current {
  final num dt;
  final num sunrise;
  final num sunset;
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
  final List<Weather> weather;

  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });
}
