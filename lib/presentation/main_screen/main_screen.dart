import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/model/Location.dart';
import 'package:weather_app/presentation/main_screen/view/main_error_view.dart';
import 'package:weather_app/presentation/main_screen/view/main_loaded_view.dart';
import 'package:weather_app/presentation/main_screen/view/main_loading_view.dart';
import 'package:weather_app/presentation/main_screen/view/unknow_view.dart';
import 'package:weather_app/presentation/state/bloc/main/main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainLoadingState) {
          BlocProvider.of<MainBloc>(context).add(MainLoadedEvent());
          return createMainLoadingView(context: context);
        }
        if (state is MainLoadedState) {
          return createMainLoadedView(
              context: context,
              location: Location(
                city: state.location.city,
                country: state.location.country,
              ),
              data: state.data);
        }
        if (state is MainErrorState) {
          return createMainErrorView(
              context: context, errorMessage: state.errorMessage);
        }
        return createUnknowView(context: context);
      },
    );
  }
}
