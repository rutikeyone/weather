import 'package:weather_app/data/api/request/get_current_weather_body.dart';
import 'package:weather_app/data/api/servise/current_weather_service.dart';
import 'package:weather_app/data/mapper/current_weather_mapper.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';

class ApiUtil {
  final CurrentWeatherService _currentWeatherService;

  ApiUtil(this._currentWeatherService);

  Future<CurrentWeatherData> getCurrentWeatherDara({
    required double latitude,
    required double longitude,
    required String units,
  }) async {
    final body = GetCurrentWeatherBody(
        latitude: latitude, longitude: longitude, units: units);
    final result = await _currentWeatherService.getCurrentWeatherData(body);
    return CurrentWeatherMapper.fromApi(result);
  }
}
