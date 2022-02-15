import 'package:weather_app/data/api/service_util.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

class CurrentWeatherDataRepository extends WeatherRepository {
  final ServiceUtils _util;

  CurrentWeatherDataRepository(this._util);

  @override
  Future<CurrentWeatherData> getCurrentWeatherData({
    required String units,
    required double longitude,
    required double latitude,
  }) {
    return _util.getCurrentWeatherData(
        latitude: latitude, longitude: longitude, units: units);
  }
}
