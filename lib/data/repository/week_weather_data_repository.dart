import 'package:weather_app/data/api/service_util.dart';
import 'package:weather_app/domain/model/week_weather/week_weather_data.dart';
import 'package:weather_app/domain/repository/week_weather_repository.dart';

class WeekWeatherDataRepository extends WeekWeatherRepository {
  final ServiceUtils _util;

  WeekWeatherDataRepository(this._util);

  @override
  Future<WeekWeatherData> getWeekWeatherData(
      {required double latitude,
      required double longitude,
      required String units}) {
    return _util.getWeekWeatherData(
        latitude: latitude, longitude: longitude, units: units);
  }
}
