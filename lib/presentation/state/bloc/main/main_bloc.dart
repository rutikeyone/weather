import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/repository/current_weather_data_repository.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/internal/current_weather_di/current_weather_controller.dart';
import 'package:weather_app/internal/locator.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(
      {required MainState initialState,
      required CurrentWeatherDataRepository repository})
      : super(initialState) {
    on<MainEvent>((event, emit) async {
      if (event is MainStartEvent) {
        emit(MainLoadingState());
      }

      if (event is MainReloadEvent) {
        emit(MainLoadingState());
      }

      if (event is MainLoadedEvent) {
        try {
          CurrentWeatherData data = await getIt
              .get<CurrentWeatherConstroller>()
              .getCurrentWeatherData(
                  latitude: 35, longitude: 35, units: "metric");
          emit(MainLoadedState(data: data));
        } catch (e) {
          emit(MainErrorState(errorMessage: e.toString()));
        }
      }
    });
  }
}
