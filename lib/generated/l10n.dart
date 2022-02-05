// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Bundung`
  String get example_name_city {
    return Intl.message(
      'Bundung',
      name: 'example_name_city',
      desc: '',
      args: [],
    );
  }

  /// `Indonesia`
  String get example_name_country {
    return Intl.message(
      'Indonesia',
      name: 'example_name_country',
      desc: '',
      args: [],
    );
  }

  /// `Heavy Rain`
  String get heavy_rain_text {
    return Intl.message(
      'Heavy Rain',
      name: 'heavy_rain_text',
      desc: '',
      args: [],
    );
  }

  /// `Sunday, 02 Oct`
  String get date_example {
    return Intl.message(
      'Sunday, 02 Oct',
      name: 'date_example',
      desc: '',
      args: [],
    );
  }

  /// `24°`
  String get temperature_example {
    return Intl.message(
      '24°',
      name: 'temperature_example',
      desc: '',
      args: [],
    );
  }

  /// `wind`
  String get wind {
    return Intl.message(
      'wind',
      name: 'wind',
      desc: '',
      args: [],
    );
  }

  /// `19 km/h`
  String get wind_example {
    return Intl.message(
      '19 km/h',
      name: 'wind_example',
      desc: '',
      args: [],
    );
  }

  /// `Feel like`
  String get feel_like {
    return Intl.message(
      'Feel like',
      name: 'feel_like',
      desc: '',
      args: [],
    );
  }

  /// `25°`
  String get feel_like_example {
    return Intl.message(
      '25°',
      name: 'feel_like_example',
      desc: '',
      args: [],
    );
  }

  /// `Index UV`
  String get index_uv {
    return Intl.message(
      'Index UV',
      name: 'index_uv',
      desc: '',
      args: [],
    );
  }

  /// `2`
  String get index_uv_example {
    return Intl.message(
      '2',
      name: 'index_uv_example',
      desc: '',
      args: [],
    );
  }

  /// `pressure`
  String get pressure {
    return Intl.message(
      'pressure',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `1014 mbar`
  String get pressure_example {
    return Intl.message(
      '1014 mbar',
      name: 'pressure_example',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today_text {
    return Intl.message(
      'Today',
      name: 'today_text',
      desc: '',
      args: [],
    );
  }

  /// `Next 16 days`
  String get next_sixteen_text {
    return Intl.message(
      'Next 16 days',
      name: 'next_sixteen_text',
      desc: '',
      args: [],
    );
  }

  /// `Details weather data text`
  String get details_weather_data_text {
    return Intl.message(
      'Details weather data text',
      name: 'details_weather_data_text',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
