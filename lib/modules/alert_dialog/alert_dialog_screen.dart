import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class AlertDialogScreen extends StatefulWidget {
  const AlertDialogScreen({Key? key}) : super(key: key);

  @override
  State<AlertDialogScreen> createState() => _AlertDialogScreenState();
}

class _AlertDialogScreenState extends State<AlertDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Alert dialog"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  showSimpleAlertdialog();
                },
                child: const Text(
                  "Simple Alert Dialog",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSimpleAlertdialog() {
    showDialog(
      barrierDismissible: false,
      //barrierColor: Colors.white,
      barrierLabel: "Hello",
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        elevation: 8,
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        title: const Text("Title"),
        content: const Text("Content"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () {
              showToast("Cancel");
              Navigator.pop(context, "Cancel");
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () {
              showToast("Ok");
              Navigator.pop(context, "Ok");
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }
}
