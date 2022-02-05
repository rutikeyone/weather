import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/presentation/next_screen/details_weather_data_screen.dart';

import 'components/additional_data_item.dart';
import 'components/location_app.dart';
import 'components/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
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
          unselectedUrl: "assets/icons/blue/cloudy_blue.png",
          selectedUrl: "assets/icons/white/cloudy_white.png",
          temperature: "21",
          time: "2:00"),
      DayData(
          unselectedUrl: "assets/icons/blue/cloudy_sun_blue.png",
          selectedUrl: "assets/icons/white/cloudy_sun_white.png",
          temperature: "20",
          time: "4:00"),
      DayData(
          unselectedUrl: "assets/icons/blue/rain_cloudy_blue.png",
          selectedUrl: "assets/icons/white/rain_cloudy_white.png",
          temperature: "22",
          time: "6:00"),
      DayData(
          unselectedUrl: "assets/icons/sun_card_icon.png",
          selectedUrl: "assets/icons/sun_card_icon.png",
          temperature: "23",
          time: "8:00"),
      DayData(
          unselectedUrl: "assets/icons/blue/cloudy_blue.png",
          selectedUrl: "assets/icons/white/cloudy_white.png",
          temperature: "22",
          time: "10:00"),
      DayData(
          unselectedUrl: "assets/icons/blue/cloudy_sun_blue.png",
          selectedUrl: "assets/icons/white/cloudy_sun_white.png",
          temperature: "24",
          time: "12:00"),
      DayData(
          unselectedUrl: "assets/icons/blue/rain_cloudy_blue.png",
          selectedUrl: "assets/icons/white/rain_cloudy_white.png",
          temperature: "25",
          time: "14:00"),
      DayData(
          unselectedUrl: "assets/icons/sun_card_icon.png",
          selectedUrl: "assets/icons/sun_card_icon.png",
          temperature: "22",
          time: "16:00"),
      DayData(
          unselectedUrl: "assets/icons/blue/cloudy_blue.png",
          selectedUrl: "assets/icons/white/cloudy_white.png",
          temperature: "22",
          time: "18:00"),
      DayData(
          unselectedUrl: "assets/icons/blue/cloudy_sun_blue.png",
          selectedUrl: "assets/icons/white/cloudy_sun_white.png",
          temperature: "21",
          time: "20:00"),
      DayData(
          unselectedUrl: "assets/icons/blue/rain_cloudy_blue.png",
          selectedUrl: "assets/icons/white/rain_cloudy_white.png",
          temperature: "20",
          time: "22:00"),
      DayData(
          unselectedUrl: "assets/icons/sun_card_icon.png",
          selectedUrl: "assets/icons/sun_card_icon.png",
          temperature: "18",
          time: "24:00"),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: createMainAppBar(
        context: context,
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
              createLocationApp(
                  context: context,
                  nameCity: S.of(context).example_name_city,
                  nameCountry: S.of(context).example_name_country),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/white/cloudy_white.png",
                          width: 96,
                          height: 96,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          S.of(context).heavy_rain_text,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          S.of(context).date_example,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          S.of(context).temperature_example,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            createAdditionalDataItem(
                              context: context,
                              title: additionalData[0].title,
                              url: additionalData[0].url,
                              data: additionalData[0].data,
                            ),
                            createAdditionalDataItem(
                              context: context,
                              title: additionalData[1].title,
                              url: additionalData[1].url,
                              data: additionalData[1].data,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            createAdditionalDataItem(
                              context: context,
                              title: additionalData[2].title,
                              url: additionalData[2].url,
                              data: additionalData[2].data,
                            ),
                            createAdditionalDataItem(
                              context: context,
                              title: additionalData[3].title,
                              url: additionalData[3].url,
                              data: additionalData[3].data,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).today_text,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsWeatherDataScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          S.of(context).next_sixteen_text,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 22,
                          color: Theme.of(context).textTheme.headline5!.color,
                        )
                      ],
                    ),
                  )
                ],
              ),
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
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).disabledColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                dayTempuratureData[index].time,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.asset(
                                dayTempuratureData[index].unselectedUrl,
                                width: 36,
                                height: 36,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                dayTempuratureData[index].temperature,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
}

//temporary classes

class AdditionalData {
  final String url;
  final String title;
  final String data;

  AdditionalData({required this.url, required this.title, required this.data});
}

class DayData {
  final String selectedUrl;
  final String unselectedUrl;
  final String temperature;
  final String time;

  DayData({
    required this.selectedUrl,
    required this.unselectedUrl,
    required this.temperature,
    required this.time,
  });
}
