import 'package:flutter/material.dart';

AppBar createMainAppBar({
  required BuildContext context,
  required VoidCallback onSearchClick,
  required VoidCallback onFavouriteClick,
}) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 2.5,
              ),
              child: IconButton(
                iconSize: 30,
                icon: const Icon(Icons.search),
                onPressed: onSearchClick,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                iconSize: 30,
                icon: const Icon(Icons.favorite),
                onPressed: onFavouriteClick,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
