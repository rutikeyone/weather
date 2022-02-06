import 'package:weather_app/data/api/api_util.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/repository/current_weather_repository.dart';

class CurrentWeatherDataRepository extends CurrentWeatherRepository {
  final ApiUtil _apiUtil;

  CurrentWeatherDataRepository(this._apiUtil);

  @override
  Future<CurrentWeatherData> getCurrentWeatherData({
    required double latitude,
    required double longitude,
    required String units,
  }) {
    return _apiUtil.getCurrentWeatherDara(
        latitude: latitude, longitude: longitude, units: units);
  }
}
