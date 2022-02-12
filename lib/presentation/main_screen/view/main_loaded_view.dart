import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/model/location.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/model/settings.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/presentation/main_screen/components/days_weather_data_header.dart';
import 'package:weather_app/presentation/main_screen/components/days_weather_data_item.dart';
import 'package:weather_app/presentation/main_screen/components/location_app_header.dart';
import 'package:weather_app/presentation/main_screen/components/main_app_bar.dart';
import 'package:weather_app/presentation/main_screen/components/main_data_card.dart';
import 'package:weather_app/presentation/next_screen/details_weather_data_screen.dart';
import 'package:weather_app/presentation/state/bloc/main/main_bloc.dart';

Scaffold createMainLoadedView({
  required BuildContext context,
  required Location location,
  required CurrentWeatherData data,
  required Settings settings,
}) {
  //Temperary data
  List<AdditionalData> additionalData = [
    AdditionalData(
        url: "assets/icons/wind.png",
        title: S.of(context).wind,
        data: S.of(context).wind_example),
    AdditionalData(
        url: "assets/icons/thermometer.png",
        title: S.of(context).feel_like,
        data: S.of(context).feel_like_example),
    AdditionalData(
        url: "assets/icons/sun.png",
        title: S.of(context).index_uv,
        data: S.of(context).index_uv_example),
    AdditionalData(
        url: "assets/icons/pulse.png",
        title: S.of(context).pressure,
        data: S.of(context).pressure_example),
  ];

  List<DayData> dayTempuratureData = [
    DayData(
        url: "assets/icons/weather_icons/01d.png",
        temperature: "21",
        time: "2:00"),
    DayData(
        url: "assets/icons/weather_icons/02d.png",
        temperature: "20",
        time: "4:00"),
    DayData(
        url: "assets/icons/weather_icons/03d.png",
        temperature: "22",
        time: "6:00"),
    DayData(
        url: "assets/icons/weather_icons/04d.png",
        temperature: "23",
        time: "8:00"),
    DayData(
        url: "assets/icons/weather_icons/09d.png",
        temperature: "22",
        time: "10:00"),
    DayData(
        url: "assets/icons/weather_icons/10d.png",
        temperature: "24",
        time: "12:00"),
    DayData(
        url: "assets/icons/weather_icons/11d.png",
        temperature: "25",
        time: "14:00"),
    DayData(
        url: "assets/icons/weather_icons/13d.png",
        temperature: "22",
        time: "16:00"),
    DayData(
        url: "assets/icons/weather_icons/09d.png",
        temperature: "22",
        time: "18:00"),
    DayData(
        url: "assets/icons/weather_icons/02d.png",
        temperature: "21",
        time: "20:00"),
    DayData(
        url: "assets/icons/weather_icons/04d.png",
        temperature: "20",
        time: "22:00"),
    DayData(
        url: "assets/icons/weather_icons/09d.png",
        temperature: "18",
        time: "24:00"),
  ];

  return Scaffold(
    backgroundColor: Theme.of(context).backgroundColor,
    appBar: createMainAppBar(
      context: context,
      isImperialUnits: settings.isImperialUnits,
      onChangeUnits: () {
        BlocProvider.of<MainBloc>(context).add(
          ChangeUnits(isImperialUnits: settings.isImperialUnits),
        );
      },
      onThemeModeClick: () {},
      onFavouriteClick: () {},
      onSearchClick: () {},
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            createLocationAppHeader(
              context: context,
              nameCity: location.city,
              nameCountry: location.country,
            ),
            const SizedBox(
              height: 30,
            ),
            createMainDataCard(
              context: context,
              isImperialUnits: settings.isImperialUnits,
              url: "assets/icons/weather_icons/${data.weather.icon!}.png",
              typeWeather: data.weather.description!,
              date: data.date,
              temperature: data.main.temp!,
              windData: data.wind.speed!,
              feelLikeData: data.main.feelsLike!,
              minTemperature: data.main.tempMin!,
              maxTemperature: data.main.tempMax!,
            ),
            const SizedBox(
              height: 30,
            ),
            createDaysWeatherDataHeader(
                context: context,
                onNextClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 130,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: dayTempuratureData.length,
                  itemBuilder: (context, index) => createDaysWeatherDataItem(
                    context: context,
                    time: dayTempuratureData[index].time,
                    temperature: dayTempuratureData[index].temperature,
                    url: dayTempuratureData[index].url,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}

//temporary classes

class AdditionalData {
  final String url;
  final String title;
  final String data;

  AdditionalData({required this.url, required this.title, required this.data});
}

class DayData {
  final String url;
  final String temperature;
  final String time;

  DayData({
    required this.url,
    required this.temperature,
    required this.time,
  });
}
