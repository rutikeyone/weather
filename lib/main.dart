import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/data/repository/current_weather_data_repository.dart';
import 'package:weather_app/internal/locator.dart';
import 'package:weather_app/presentation/main_screen/main_screen.dart';
import 'package:weather_app/presentation/theme/dark_theme.dart';
import 'package:weather_app/presentation/theme/light_theme.dart';

import 'generated/l10n.dart';
import 'presentation/state/bloc/main/main_bloc.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(
            initialState: MainInitialState(),
            repository: getIt.get<CurrentWeatherDataRepository>(),
          )..add(MainStartEvent()),
        ),
      ],
      child: AdaptiveTheme(
        initial: AdaptiveThemeMode.light,
        light: light,
        dark: dark,
        builder: (light, dark) => MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: light,
          darkTheme: dark,
          supportedLocales: S.delegate.supportedLocales,
          home: const SafeArea(
            child: MainScreen(),
          ),
        ),
      ),
    );
  }
}
