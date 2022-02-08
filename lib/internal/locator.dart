import 'package:get_it/get_it.dart';
import 'package:weather_app/data/api/api_util.dart';
import 'package:weather_app/data/api/servise/current_weather_service.dart';
import 'package:weather_app/data/repository/current_weather_data_repository.dart';
import 'package:weather_app/internal/current_weather_di/current_weather_controller.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<CurrentWeatherDataRepository>(
    () => CurrentWeatherDataRepository(
      getIt.get<ApiUtil>(),
    ),
  );

  getIt.registerLazySingleton(
    () => ApiUtil(
      getIt.get<CurrentWeatherService>(),
    ),
  );

  getIt.registerLazySingleton(() => CurrentWeatherService());

  getIt.registerLazySingleton<CurrentWeatherConstroller>(
    () => CurrentWeatherConstroller(),
  );
}
