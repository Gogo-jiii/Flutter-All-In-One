import 'package:flutter/material.dart';

class SnackBarScreen extends StatefulWidget {
  const SnackBarScreen({Key? key}) : super(key: key);

  @override
  State<SnackBarScreen> createState() => _SnackBarScreenState();
}

class _SnackBarScreenState extends State<SnackBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Snack Bar"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            showSnackBar(context);
          },
          child: const Text("Show Snack Bar"),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  SnackBar snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(minutes: 1),
    content: const Text("This is a Snack Bar."),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        debugPrint("Dismissed.");
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
