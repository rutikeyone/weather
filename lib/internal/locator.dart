import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/api/service_util.dart';
import 'package:weather_app/data/api/servise/current_location_service.dart';
import 'package:weather_app/data/api/servise/current_weather_service.dart';
import 'package:weather_app/data/api/servise/week_weather_service.dart';
import 'package:weather_app/data/mapper/week_weather_mapper.dart';
import 'package:weather_app/data/repository/current_weather_data_repository.dart';
import 'package:weather_app/data/repository/get_current_location_data_repository.dart';
import 'package:weather_app/data/repository/settings_data_repository.dart';
import 'package:weather_app/data/repository/week_weather_data_repository.dart';
import 'package:weather_app/internal/current_location_di/current_location_controller.dart';
import 'package:weather_app/internal/current_weather_di/current_weather_controller.dart';
import 'package:weather_app/internal/settings_di/settings_controller.dart';
import 'package:weather_app/internal/week_weather_di/week_weather_controller.dart';

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
      util: getIt.get<ServiceUtils>(),
    ),
  );

  getIt.registerLazySingleton<CurrentLocationColntroller>(
    () => CurrentLocationColntroller(),
  );

  getIt.registerLazySingleton<CurrentWeatherDataRepository>(
    () => CurrentWeatherDataRepository(
      getIt.get<ServiceUtils>(),
    ),
  );

  getIt.registerLazySingleton(
    () => ServiceUtils(
      currentWeatherService: getIt.get<CurrentWeatherService>(),
      currentLocationService: getIt.get<CurrentLocationService>(),
      weekWeatherService: getIt.get<WeekWeatherService>(),
    ),
  );

  getIt.registerLazySingleton(() => CurrentWeatherService());

  getIt.registerLazySingleton(() => CurrentLocationService());

  getIt.registerLazySingleton<CurrentWeatherController>(
    () => CurrentWeatherController(),
  );

  getIt.registerLazySingleton(() => WeekWeatherService());
  getIt.registerLazySingleton<WeekWeatherDataRepository>(
    () => WeekWeatherDataRepository(
      getIt.get<ServiceUtils>(),
    ),
  );
  getIt.registerLazySingleton<WeekWeatherController>(
    () => WeekWeatherController(),
  );
}
