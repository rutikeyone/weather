import 'package:flutter/material.dart';

Padding createHourlyWeatherDataItem({
  required BuildContext context,
  required int hour,
  required String url,
  required int temp,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).disabledColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.5),
        child: Column(
          children: [
            Text(
              hour.toString() + ":00",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/icons/weather_icons/${url}.png",
              width: 36,
              height: 36,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              temp.toString(),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}
