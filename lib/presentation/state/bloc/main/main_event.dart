part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const MainEvent();
}

class MainStartEvent extends MainEvent {}

class MainLoadingEvent extends MainEvent {}

class MainReloadEvent extends MainEvent {}

class MainLoadedEvent extends MainEvent {}

class MainErrorEvent extends MainEvent {}
