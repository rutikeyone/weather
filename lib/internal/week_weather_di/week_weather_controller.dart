import 'package:weather_app/data/repository/week_weather_data_repository.dart';
import 'package:weather_app/domain/model/week_weather/week_weather_data.dart';

import '../locator.dart';

class WeekWeatherController {
  Future<WeekWeatherData> getWeekWeatherData(
      {required double latitude,
      required double longitude,
      required String units}) {
    return getIt.get<WeekWeatherDataRepository>().getWeekWeatherData(
        latitude: latitude, longitude: longitude, units: units);
  }
}
