import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';

import 'main_card_data_item.dart';

Container createMainDataCard({
  required BuildContext context,
  required String url,
  required String typeWeather,
  required String date,
  required String temperature,
  required String windData,
  required String feelLikeData,
  required String indexUvData,
  required String pressureData,
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
              width: 96,
              height: 96,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              typeWeather,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              temperature,
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
                  url: "assets/icons/wind.png",
                  data: windData,
                ),
                createMainCardDataItem(
                  context: context,
                  title: S.of(context).feel_like,
                  url: "assets/icons/thermometer.png",
                  data: feelLikeData,
                ),
              ],
            ),
            Row(
              children: [
                createMainCardDataItem(
                  context: context,
                  title: S.of(context).index_uv,
                  url: "assets/icons/sun.png",
                  data: indexUvData,
                ),
                createMainCardDataItem(
                  context: context,
                  title: S.of(context).pressure,
                  url: "assets/icons/pulse.png",
                  data: pressureData,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
