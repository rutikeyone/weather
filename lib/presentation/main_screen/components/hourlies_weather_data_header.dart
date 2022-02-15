import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';

Row createHourliesWeatherDataHeader({
  required BuildContext context,
  required VoidCallback onNextClick,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        S.of(context).today_text,
        style: Theme.of(context).textTheme.headline4,
      ),
      TextButton(
        onPressed: onNextClick,
        child: Row(
          children: [
            Text(
              S.of(context).next_seventh_text,
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
  );
}
