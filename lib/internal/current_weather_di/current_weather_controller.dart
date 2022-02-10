import 'package:weather_app/data/repository/current_weather_data_repository.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';

import '../locator.dart';

class CurrentWeatherController {
  Future<CurrentWeatherData> getCurrentWeatherData(
      {required String city,
      required String country,
      required String units}) async {
    return await getIt
        .get<CurrentWeatherDataRepository>()
        .getCurrentWeatherData(city: city, country: country, units: units);
  }
}
