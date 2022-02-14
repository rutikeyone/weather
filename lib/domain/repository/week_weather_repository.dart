import 'package:weather_app/domain/model/week_weather/week_weather_data.dart';

abstract class WeekWeatherRepository {
  Future<WeekWeatherData> getWeekWeatherData({
    required double latitude,
    required double longitude,
    required String units,
  });
}
