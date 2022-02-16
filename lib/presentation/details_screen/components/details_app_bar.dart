import 'package:flutter/material.dart';

AppBar createDetailsAppBar({
  required BuildContext context,
  required VoidCallback onBackClick,
  required String nameCity,
  required String nameCountry,
}) {
  return AppBar(
    backgroundColor: Theme.of(context).cardColor,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      iconSize: 20,
      onPressed: onBackClick,
    ),
    title: RichText(
      text: TextSpan(
        text: nameCity + ", ",
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        children: [
          TextSpan(
            text: nameCountry,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}
