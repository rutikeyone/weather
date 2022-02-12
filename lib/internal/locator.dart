import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/api/Util.dart';
import 'package:weather_app/data/api/servise/current_location_service.dart';
import 'package:weather_app/data/api/servise/current_weather_service.dart';
import 'package:weather_app/data/repository/current_weather_data_repository.dart';
import 'package:weather_app/data/repository/get_current_location_repository.dart';
import 'package:weather_app/data/repository/settings_data_repository.dart';
import 'package:weather_app/internal/current_location_di/current_location_controller.dart';
import 'package:weather_app/internal/current_weather_di/current_weather_controller.dart';
import 'package:weather_app/internal/settings_di/settings_controller.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  getIt.registerLazySingleton<SettingsDataRepository>(
    () => SettingsDataRepository(
      sharedPreferences: getIt.get<SharedPreferences>(),
    ),
  );

  getIt.registerLazySingleton<SettingsController>(() => SettingsController());

  getIt.registerLazySingleton<GetCurrentLocationRepository>(
    () => GetCurrentLocationRepository(
      util: getIt.get<Util>(),
    ),
  );

  getIt.registerLazySingleton<CurrentLocationColntroller>(
    () => CurrentLocationColntroller(),
  );

  getIt.registerLazySingleton<CurrentWeatherDataRepository>(
    () => CurrentWeatherDataRepository(
      getIt.get<Util>(),
    ),
  );

  getIt.registerLazySingleton(
    () => Util(
      getIt.get<CurrentWeatherService>(),
      getIt.get<CurrentLocationService>(),
    ),
  );

  getIt.registerLazySingleton(() => CurrentWeatherService());

  getIt.registerLazySingleton(() => CurrentLocationService());

  getIt.registerLazySingleton<CurrentWeatherController>(
    () => CurrentWeatherController(),
  );
}
