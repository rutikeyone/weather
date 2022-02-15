import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/repository/current_weather_data_repository.dart';
import 'package:weather_app/domain/model/location.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/model/settings.dart';
import 'package:weather_app/domain/model/week_weather/hourly.dart';
import 'package:weather_app/internal/current_location_di/current_location_controller.dart';
import 'package:weather_app/internal/current_weather_di/current_weather_controller.dart';
import 'package:weather_app/internal/locator.dart';
import 'package:weather_app/internal/settings_di/settings_controller.dart';
import 'package:weather_app/internal/week_weather_di/week_weather_controller.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(
      {required MainState initialState,
      required CurrentWeatherDataRepository repository})
      : super(initialState) {
    on<MainEvent>(
      (event, emit) async {
        if (event is MainStartEvent) {
          emit(MainLoadingState());
        }

        if (event is MainReloadEvent) {
          emit(MainLoadingState());
        }

        if (event is MainLoadedEvent) {
          try {
            final _currentLocation = await getIt
                .get<CurrentLocationColntroller>()
                .getCurrentLocation();

            final _settings = getIt.get<SettingsController>().getSettings();

            final _currentWeatherData = await getIt
                .get<CurrentWeatherController>()
                .getCurrentWeatherData(
                    latitude: _currentLocation.latitude,
                    longitude: _currentLocation.longitude,
                    units: _settings.units);

            final _weekWeatherData =
                await getIt.get<WeekWeatherController>().getWeekWeatherData(
                      latitude: _currentLocation.latitude,
                      longitude: _currentLocation.longitude,
                      units: _settings.units,
                    );
            emit(
              MainLoadedState(
                location: Location(
                  city: _currentLocation.city,
                  country: _currentLocation.country,
                ),
                hourlies: _weekWeatherData.hourlies
                    .where((element) => element.hour % 2 == 0)
                    .toList(),
                data: _currentWeatherData,
                settings: _settings,
              ),
            );
          } catch (e) {
            emit(
              MainErrorState(
                errorMessage: e.toString(),
              ),
            );
          }
        }

        if (event is ChangeUnits) {
          getIt
              .get<SettingsController>()
              .changeUnits(isImperialUnits: event.isImperialUnits);
          emit(MainLoadingState());
        }
      },
    );
  }
}
