import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/generated/l10n.dart';

import 'main_card_data_item.dart';

Container createMainDataCard({
  required BuildContext context,
  required bool isImperialUnits,
  required DateTime date,
  required String url,
  required String typeWeather,
  required num temperature,
  required num windData,
  required num feelLikeData,
  required num minTemperature,
  required num maxTemperature,
}) {
  return Container(
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
              url,
              width: 115,
              height: 115,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              StringUtils.capitalize(typeWeather),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${StringUtils.capitalize((DateFormat('EEEE').format(date)))}, ${date.day} ${StringUtils.capitalize((DateFormat('MMM').format(date)))}",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              temperature.round().toString() +
                  (isImperialUnits
                      ? S.of(context).imperialTemperature
                      : S.of(context).metricTemperature),
              maxLines: 1,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                createMainCardDataItem(
                  context: context,
                  title: S.of(context).wind,
                  url: "assets/icons/main_card_icons/wind.png",
                  data: windData.round().toString() +
                      " " +
                      (isImperialUnits
                          ? S.of(context).imperialWindSpeed
                          : S.of(context).metricWindSpeed),
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
                createMainCardDataItem(
                  context: context,
                  title: S.of(context).feel_like,
                  url: "assets/icons/main_card_icons/thermometer.png",
                  data: feelLikeData.round().toString() +
                      (isImperialUnits
                          ? S.of(context).imperialTemperature
                          : S.of(context).metricTemperature),
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                createMainCardDataItem(
                  context: context,
                  title: S.of(context).min,
                  url: "assets/icons/main_card_icons/thermometer_min.png",
                  data: minTemperature.round().toString() +
                      (isImperialUnits
                          ? S.of(context).imperialTemperature
                          : S.of(context).metricTemperature),
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
                createMainCardDataItem(
                  context: context,
                  title: S.of(context).max,
                  url: "assets/icons/main_card_icons/thermometer_max.png",
                  data: maxTemperature.round().toString() +
                      (isImperialUnits
                          ? S.of(context).imperialTemperature
                          : S.of(context).metricTemperature),
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
