part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {
  @override
  List<Object?> get props => [];
  const MainState();
}

class MainInitialState extends MainState {}

class MainLoadingState extends MainState {}

class MainLoadedState extends MainState {
  final CurrentWeatherData data;
  final Location location;
  final Settings settings;
  @override
  List<Object?> get props => [data, location, settings];

  const MainLoadedState(
      {required this.location, required this.data, required this.settings});
}

class MainErrorState extends MainState {
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
  const MainErrorState({required this.errorMessage});
}
