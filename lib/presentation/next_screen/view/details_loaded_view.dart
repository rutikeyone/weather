import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/presentation/next_screen/components/day_weather_data_item.dart';
import 'package:weather_app/presentation/next_screen/components/details_app_bar.dart';

class DetailLoadedView extends StatelessWidget {
  DetailLoadedView({Key? key}) : super(key: key);

  List<DayData> daysData = [
    DayData(
      url: "assets/icons/weather_icons/01d.png",
      maxTemperature: "32",
      minTemperature: "31",
      date: "Monday, 02 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/02d.png",
      maxTemperature: "28",
      minTemperature: "26",
      date: "Thuesday, 03 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/03d.png",
      maxTemperature: "29",
      minTemperature: "25",
      date: "Wednesday, 04 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/04d.png",
      maxTemperature: "26",
      minTemperature: "24",
      date: "Thursday, 05 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/09d.png",
      maxTemperature: "27",
      minTemperature: "25",
      date: "Friday, 06 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/10d.png",
      maxTemperature: "26",
      minTemperature: "23",
      date: "Saturday, 07 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/11d.png",
      maxTemperature: "25",
      minTemperature: "22",
      date: "Sunday, 08 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/13d.png",
      maxTemperature: "32",
      minTemperature: "31",
      date: "Monday, 09 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/01d.png",
      maxTemperature: "28",
      minTemperature: "26",
      date: "Thuesday, 10 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/02d.png",
      maxTemperature: "29",
      minTemperature: "25",
      date: "Wednesday, 11 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/03d.png",
      maxTemperature: "26",
      minTemperature: "24",
      date: "Thursday, 12 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/04d.png",
      maxTemperature: "27",
      minTemperature: "25",
      date: "Friday, 13 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/09d.png",
      maxTemperature: "26",
      minTemperature: "23",
      date: "Saturday, 14 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/10d.png",
      maxTemperature: "25",
      minTemperature: "22",
      date: "Sunday, 15 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/01d.png",
      maxTemperature: "32",
      minTemperature: "31",
      date: "Monday, 02 Oct",
    ),
    DayData(
      url: "assets/icons/weather_icons/02d.png",
      maxTemperature: "28",
      minTemperature: "26",
      date: "Thuesday, 03 Oct",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).cardColor,
        appBar: createDetailsAppBar(
          context: context,
          onBackClick: () => Navigator.pop(context),
          nameCity: S.of(context).example_name_city,
          nameCountry: S.of(context).example_name_country,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                S.of(context).next_sixteen_text,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: daysData.length,
                  itemBuilder: (context, index) => createDayWeatherDataItem(
                    context: context,
                    url: daysData[index].url,
                    date: daysData[index].date,
                    maxTemperature: daysData[index].maxTemperature,
                    minTemperature: daysData[index].minTemperature,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//temporary classes
class DayData {
  final String url;
  final String minTemperature;
  final String maxTemperature;
  final String date;

  DayData({
    required this.url,
    required this.minTemperature,
    required this.maxTemperature,
    required this.date,
  });
}
