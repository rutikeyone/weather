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
  @override
  List<Object?> get props => [data];

  const MainLoadedState({required this.data});
}

class MainErrorState extends MainState {
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
  const MainErrorState({required this.errorMessage});
}
