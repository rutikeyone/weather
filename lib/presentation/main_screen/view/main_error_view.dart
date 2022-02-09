import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/presentation/state/bloc/main/main_bloc.dart';

Scaffold createMainErrorView(
    {required BuildContext context, required String errorMessage}) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(
              "assets/icons/error_man.png",
              width: 512,
            ),
          ),
          Text(
            "Oops! Something went wrong",
            style: Theme.of(context).textTheme.headline2,
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(MainReloadEvent());
              },
              icon: Icon(
                Icons.replay_circle_filled_sharp,
                size: 54,
                color: Theme.of(context).textTheme.headline2!.color,
              ))
        ],
      ),
    ),
  );
}
