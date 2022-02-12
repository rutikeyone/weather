import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/repository/current_weather_data_repository.dart';
import 'package:weather_app/domain/model/location.dart';
import 'package:weather_app/domain/model/current_location/current_location_data.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/model/settings.dart';
import 'package:weather_app/internal/current_location_di/current_location_controller.dart';
import 'package:weather_app/internal/current_weather_di/current_weather_controller.dart';
import 'package:weather_app/internal/locator.dart';
import 'package:weather_app/internal/settings_di/settings_controller.dart';

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

            final settings = getIt.get<SettingsController>().getSettings();

            CurrentWeatherData data = await getIt
                .get<CurrentWeatherController>()
                .getCurrentWeatherData(
                    city: _currentLocation.city,
                    country: _currentLocation.country,
                    units: settings.units);

            emit(
              MainLoadedState(
                location: Location(
                  city: _currentLocation.city,
                  country: _currentLocation.country,
                ),
                data: data,
                settings: settings,
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
