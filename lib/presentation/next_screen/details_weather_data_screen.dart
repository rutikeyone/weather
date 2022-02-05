import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';

class DetailsWeatherDataScreen extends StatelessWidget {
  DetailsWeatherDataScreen({Key? key}) : super(key: key);

  List<DayData> daysData = [
    DayData(
      url: "assets/icons/white/cloudy_sun_white.png",
      maxTemperature: "32",
      minTemperature: "31",
      date: "Monday, 02 Oct",
    ),
    DayData(
      url: "assets/icons/white/cloudy_white.png",
      maxTemperature: "28",
      minTemperature: "26",
      date: "Thuesday, 03 Oct",
    ),
    DayData(
      url: "assets/icons/white/rain_cloudy_white.png",
      maxTemperature: "29",
      minTemperature: "25",
      date: "Wednesday, 04 Oct",
    ),
    DayData(
      url: "assets/icons/white/cloudy_white.png",
      maxTemperature: "26",
      minTemperature: "24",
      date: "Thursday, 05 Oct",
    ),
    DayData(
      url: "assets/icons/sun_card_icon.png",
      maxTemperature: "27",
      minTemperature: "25",
      date: "Friday, 06 Oct",
    ),
    DayData(
      url: "assets/icons/sun_card_icon.png",
      maxTemperature: "26",
      minTemperature: "23",
      date: "Saturday, 07 Oct",
    ),
    DayData(
      url: "assets/icons/white/rain_cloudy_white.png",
      maxTemperature: "25",
      minTemperature: "22",
      date: "Sunday, 08 Oct",
    ),
    DayData(
      url: "assets/icons/white/cloudy_sun_white.png",
      maxTemperature: "32",
      minTemperature: "31",
      date: "Monday, 09 Oct",
    ),
    DayData(
      url: "assets/icons/white/cloudy_white.png",
      maxTemperature: "28",
      minTemperature: "26",
      date: "Thuesday, 10 Oct",
    ),
    DayData(
      url: "assets/icons/white/rain_cloudy_white.png",
      maxTemperature: "29",
      minTemperature: "25",
      date: "Wednesday, 11 Oct",
    ),
    DayData(
      url: "assets/icons/white/cloudy_white.png",
      maxTemperature: "26",
      minTemperature: "24",
      date: "Thursday, 12 Oct",
    ),
    DayData(
      url: "assets/icons/sun_card_icon.png",
      maxTemperature: "27",
      minTemperature: "25",
      date: "Friday, 13 Oct",
    ),
    DayData(
      url: "assets/icons/sun_card_icon.png",
      maxTemperature: "26",
      minTemperature: "23",
      date: "Saturday, 14 Oct",
    ),
    DayData(
      url: "assets/icons/white/rain_cloudy_white.png",
      maxTemperature: "25",
      minTemperature: "22",
      date: "Sunday, 15 Oct",
    ),
    DayData(
      url: "assets/icons/white/cloudy_sun_white.png",
      maxTemperature: "32",
      minTemperature: "31",
      date: "Monday, 02 Oct",
    ),
    DayData(
      url: "assets/icons/white/cloudy_white.png",
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 20,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: RichText(
            text: TextSpan(
              text: S.of(context).example_name_city + ", ",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
              children: [
                TextSpan(
                  text: S.of(context).example_name_country,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 18),
                ),
              ],
            ),
          ),
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
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Image.asset(
                        daysData[index].url,
                        width: 28,
                        height: 28,
                      ),
                      title: Text(
                        daysData[index].date,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      trailing: RichText(
                        text: TextSpan(
                          text: daysData[index].maxTemperature + "/",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 22),
                          children: [
                            TextSpan(
                              text: daysData[index].minTemperature,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ),
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
