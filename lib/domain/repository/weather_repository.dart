import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherData> getCurrentWeatherData({
    required String city,
    required String country,
    required String units,
  });
}
