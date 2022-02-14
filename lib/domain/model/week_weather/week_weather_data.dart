import 'package:http/http.dart';

import 'current.dart';
import 'daily.dart';
import 'hourly.dart';

class WeekWeatherData {
  final num lat;
  final num lon;
  final String timezone;
  final num timezoneOffset;
  final Current current;
  final List<Hourly> hourlies;
  final List<Daily> dailies;

  WeekWeatherData({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourlies,
    required this.dailies,
  });
}
