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
  final String city;
  final String country;
  @override
  List<Object?> get props => [data, city, country];

  const MainLoadedState(
      {required this.city, required this.country, required this.data});
}

class MainErrorState extends MainState {
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
  const MainErrorState({required this.errorMessage});
}
