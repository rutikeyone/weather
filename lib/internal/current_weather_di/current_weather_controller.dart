import 'package:weather_app/data/repository/current_weather_data_repository.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';

import '../locator.dart';

class CurrentWeatherConstroller {
  Future<CurrentWeatherData> getCurrentWeatherData(
      {required double latitude,
      required double longitude,
      required String units}) async {
    return await getIt
        .get<CurrentWeatherDataRepository>()
        .getCurrentWeatherData(
            latitude: latitude, longitude: longitude, units: units);
  }
}
