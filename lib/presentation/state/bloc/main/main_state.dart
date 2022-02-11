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
  @override
  List<Object?> get props => [data, location];

  const MainLoadedState({required this.location, required this.data});
}

class MainErrorState extends MainState {
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
  const MainErrorState({required this.errorMessage});
}
