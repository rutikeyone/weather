import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';

import 'components/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    List<DataHelper> data = [
      DataHelper(
          url: "assets/icons/wind.png",
          title: S.of(context).wind,
          data: S.of(context).wind_example),
      DataHelper(
          url: "assets/icons/thermometer.png",
          title: S.of(context).feel_like,
          data: S.of(context).feel_like_example),
      DataHelper(
          url: "assets/icons/sun.png",
          title: S.of(context).index_uv,
          data: S.of(context).index_uv_example),
      DataHelper(
          url: "assets/icons/pulse.png",
          title: S.of(context).pressure,
          data: S.of(context).pressure_example),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: createMainAppBar(
        context: context,
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
              RichText(
                text: TextSpan(
                  text: "${S.of(context).example_name_city}, ",
                  style: Theme.of(context).textTheme.headline2,
                  children: [
                    TextSpan(
                        text: S.of(context).example_name_country,
                        style: Theme.of(context).textTheme.headline3),
                  ],
                ),
              ),
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
                        GridView.builder(
                          itemCount: data.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 100,
                          ),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).dividerColor,
                                ),
                                right: BorderSide(
                                  width: 1.5,
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    data[index].url,
                                    color: Theme.of(context).canvasColor,
                                    width: 28,
                                    height: 28,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.5),
                                        child: Text(
                                            data[index].title.toUpperCase()),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.5),
                                        child: Text(data[index].data),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataHelper {
  final String url;
  final String title;
  final String data;

  DataHelper({required this.url, required this.title, required this.data});
}
