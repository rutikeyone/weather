import 'package:weather_app/data/api/request/get_current_weather_body.dart';
import 'package:weather_app/data/api/servise/current_location_service.dart';
import 'package:weather_app/data/api/servise/current_weather_service.dart';
import 'package:weather_app/data/mapper/current_location_mapper.dart';
import 'package:weather_app/data/mapper/current_weather_mapper.dart';
import 'package:weather_app/domain/model/current_location/current_location_data.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';

class Util {
  final CurrentWeatherService _currentWeatherService;
  final CurrentLocationService _currentLocationService;

  Util(this._currentWeatherService, this._currentLocationService);

  Future<CurrentWeatherData> getCurrentWeatherData({
    required String city,
    required String country,
    required String units,
  }) async {
    final body =
        GetCurrentWeatherBody(city: city, country: country, units: units);
    final result = await _currentWeatherService.getCurrentWeatherData(body);
    return CurrentWeatherMapper.fromApi(result);
  }

  Future<CurrentLocationData> getCurrentLocationData() async {
    final result = await _currentLocationService.getCurrentLocation();
    return CurrentLocationMapper.fromApi(result);
  }
}
