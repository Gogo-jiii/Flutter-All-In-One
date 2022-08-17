import 'package:flutter/material.dart';

Widget getListItem(BuildContext context, List<String> data, int index) {
  return Card(
    margin: const EdgeInsets.all(8),
    elevation: 1,
    shape: RoundedRectangleBorder(
      side: BorderSide(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          width: 1.0,
          style: BorderStyle.solid),
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    borderOnForeground: true,
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Center(
        child: Text(
          data[index],
          softWrap: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget getCardButton(BuildContext context, String text) {
  return Card(
    margin: const EdgeInsets.all(8),
    elevation: 1,
    shape: RoundedRectangleBorder(
      side: BorderSide(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          width: 1.0,
          style: BorderStyle.solid),
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    borderOnForeground: true,
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Center(
        child: Text(
          text,
          softWrap: true,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

PreferredSizeWidget getAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
