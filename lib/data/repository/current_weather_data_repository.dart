import 'package:weather_app/data/api/Util.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

class CurrentWeatherDataRepository extends WeatherRepository {
  final Util _util;

  CurrentWeatherDataRepository(this._util);

  @override
  Future<CurrentWeatherData> getCurrentWeatherData({
    required String city,
    required String country,
    required String units,
  }) {
    return _util.getCurrentWeatherData(
        city: city, country: country, units: units);
  }
}
