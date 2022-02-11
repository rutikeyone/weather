import 'coord.dart';
import 'main.dart';
import 'weather.dart';
import 'wind.dart';

class CurrentWeatherData {
  String name;
  Coord coord;
  Weather weather;
  Main main;
  int visibility;
  Wind wind;
  DateTime date;

  CurrentWeatherData({
    required this.date,
    required this.name,
    required this.coord,
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
  });
}
