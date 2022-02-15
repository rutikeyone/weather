import 'package:weather_app/data/api/request/get_weather_body.dart';
import 'package:weather_app/data/api/servise/current_location_service.dart';
import 'package:weather_app/data/api/servise/current_weather_service.dart';
import 'package:weather_app/data/api/servise/week_weather_service.dart';
import 'package:weather_app/data/mapper/current_location_mapper.dart';
import 'package:weather_app/data/mapper/current_weather_mapper.dart';
import 'package:weather_app/data/mapper/week_weather_mapper.dart';
import 'package:weather_app/domain/model/current_location/current_location_data.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/model/week_weather/week_weather_data.dart';

class ServiceUtils {
  final CurrentWeatherService currentWeatherService;
  final CurrentLocationService currentLocationService;
  final WeekWeatherService weekWeatherService;

  ServiceUtils({
    required this.currentWeatherService,
    required this.currentLocationService,
    required this.weekWeatherService,
  });

  Future<CurrentWeatherData> getCurrentWeatherData({
    required double latitude,
    required double longitude,
    required String units,
  }) async {
    final body =
        GetWeatherBody(latitude: latitude, longitude: longitude, units: units);
    final result = await currentWeatherService.getCurrentWeatherData(body);
    return CurrentWeatherMapper.fromApi(result);
  }

  Future<CurrentLocationData> getCurrentLocationData() async {
    final result = await currentLocationService.getCurrentLocation();
    return CurrentLocationMapper.fromApi(result);
  }

  Future<WeekWeatherData> getWeekWeatherData({
    required double latitude,
    required double longitude,
    required String units,
  }) async {
    final body =
        GetWeatherBody(latitude: latitude, longitude: longitude, units: units);
    final result = await weekWeatherService.getWeeksWeatherData(body);
    return WeekWeatherMapper.fromApi(result);
  }
}
