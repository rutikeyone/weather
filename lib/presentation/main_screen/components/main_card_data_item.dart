import 'package:flutter/material.dart';

Widget createMainCardDataItem({
  required BuildContext context,
  required String url,
  required String title,
  required String data,
  required Border border,
}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: border,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                url,
                color: Theme.of(context).canvasColor,
                width: 32,
                height: 32,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.5),
                      child: Text(
                        title.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.5),
                      child: Text(
                        data,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
