import 'package:flutter/material.dart';

Padding createDayWeatherDataItem({
  required BuildContext context,
  required String url,
  required String date,
  required String maxTemperature,
  required String minTemperature,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      leading: Image.asset(
        url,
        width: 28,
        height: 28,
      ),
      title: Text(
        date,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      trailing: RichText(
        text: TextSpan(
          text: maxTemperature + "/",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 22),
          children: [
            TextSpan(
              text: minTemperature,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    ),
  );
}
