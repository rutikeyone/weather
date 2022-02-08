import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/state/bloc/main/main_bloc.dart';

Scaffold createMainLoadingView({required BuildContext context}) {
  return Scaffold(
    body: Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).cardColor,
      ),
    ),
  );
}
