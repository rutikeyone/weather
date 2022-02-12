import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherData> getCurrentWeatherData({
    required double latitude,
    required double longitude,
    required String units,
  });
}
