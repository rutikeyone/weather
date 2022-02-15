import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/model/day_data.dart';
import 'package:weather_app/domain/model/location.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/model/settings.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/presentation/main_screen/components/hourlies_weather_data_header.dart';
import 'package:weather_app/presentation/main_screen/components/hourly_weather_data_item.dart';
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
  required List<DayData> daysData,
}) {
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
              url: "assets/icons/weather_icons/${data.weather.icon}.png",
              typeWeather: data.weather.description,
              date: data.date,
              temperature: data.main.temp,
              windData: data.wind.speed,
              feelLikeData: data.main.feelsLike,
              minTemperature: data.main.tempMin,
              maxTemperature: data.main.tempMax,
            ),
            const SizedBox(
              height: 30,
            ),
            createHourliesWeatherDataHeader(
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
                  itemCount: daysData.length,
                  itemBuilder: (context, index) => createHourlyWeatherDataItem(
                    context: context,
                    hour: daysData[index].hour,
                    temp: daysData[index].temp,
                    url: daysData[index].url,
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
