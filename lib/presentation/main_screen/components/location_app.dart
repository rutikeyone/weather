import 'package:flutter/material.dart';

RichText createLocationApp({
  required BuildContext context,
  required String nameCountry,
  required String nameCity,
}) {
  return RichText(
    text: TextSpan(
      text: nameCity + ", ",
      style: Theme.of(context).textTheme.headline2,
      children: [
        TextSpan(
            text: nameCountry, style: Theme.of(context).textTheme.headline3),
      ],
    ),
  );
}
