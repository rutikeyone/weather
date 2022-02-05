import 'package:flutter/material.dart';

Padding createDaysWeatherDataItem({
  required BuildContext context,
  required String time,
  required String url,
  required String temperature,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).disabledColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              url,
              width: 36,
              height: 36,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              temperature,
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
