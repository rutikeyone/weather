import 'package:flutter/material.dart';

AppBar createMainAppBar({
  required BuildContext context,
  required bool isImperialUnits,
  required VoidCallback onChangeUnits,
  required VoidCallback onThemeModeClick,
}) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    elevation: 0,
    leading: IconButton(
      iconSize: 30,
      icon: const Icon(Icons.light_mode),
      onPressed: onThemeModeClick,
      color: Theme.of(context).iconTheme.color,
    ),
    actions: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              iconSize: 30,
              icon: Image.asset(
                "assets/icons/header_icons/imperial_icon.png",
                color: isImperialUnits
                    ? Theme.of(context).cardColor
                    : Theme.of(context).iconTheme.color,
              ),
              onPressed: onChangeUnits,
            ),
          ),
        ],
      ),
    ],
  );
}
