import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/model/detail_day_data.dart';
import 'package:weather_app/generated/l10n.dart';
import 'components/day_weather_data_item.dart';
import 'components/details_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final String country;
  final String city;
  final List<DetailsDayData> detailsDayData;

  DetailsScreen({
    Key? key,
    required this.country,
    required this.city,
    required this.detailsDayData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).cardColor,
        appBar: createDetailsAppBar(
          context: context,
          onBackClick: () => Navigator.pop(context),
          nameCity: city,
          nameCountry: country,
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
                S.of(context).next_seventh_text,
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
                  itemCount: detailsDayData.length,
                  itemBuilder: (context, index) => createDayWeatherDataItem(
                    context: context,
                    url:
                        "assets/icons/weather_icons/${detailsDayData[index].url}.png",
                    date:
                        "${StringUtils.capitalize(DateFormat('EEEE').format(detailsDayData[index].date))}, ${detailsDayData[index].date.day} ${StringUtils.capitalize(
                      DateFormat('MMM').format(detailsDayData[index].date),
                    )}",
                    maxTemperature: detailsDayData[index].maxTemp.toString(),
                    minTemperature: detailsDayData[index].minTemp.toString(),
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
