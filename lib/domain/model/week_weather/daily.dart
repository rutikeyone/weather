import 'package:http/http.dart';

import 'feels_like.dart';
import 'temp.dart';
import 'weather.dart';

class Daily {
  final DateTime date;
  final num sunrise;
  final num sunset;
  final num moonrise;
  final num moonset;
  final num moonPhase;
  final Temp temp;
  final FeelsLike feelsLike;
  final num pressure;
  final num humidity;
  final num dewPoint;
  final num windSpeed;
  final num windDeg;
  final num windGust;
  final List<Weather> weather;
  final num clouds;
  final num pop;
  final num uvi;

  Daily({
    required this.date,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  });
}
