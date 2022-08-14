import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';

class SnackBarScreen extends StatefulWidget {
  const SnackBarScreen({Key? key}) : super(key: key);

  @override
  State<SnackBarScreen> createState() => _SnackBarScreenState();
}

class _SnackBarScreenState extends State<SnackBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Snack Bar"),
      body: Center(
        child: TextButton(
          onPressed: () {
            showSnackBar(context, "This is a Snack Bar");
          },
          child: const Text(
            "Show Snack Bar",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String msg) {
  SnackBar snackBar = SnackBar(
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(minutes: 1),
    content: Text(
      msg,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    action: SnackBarAction(
      textColor: Colors.black,
      label: 'Close',
      onPressed: () {
        debugPrint("Dismissed.");
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
