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
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  showOptionAlertDialog();
                },
                child: const Text(
                  "Option Alert Dialog",
                ),
              ),
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

  Future<void> showOptionAlertDialog() async {
    switch (await showDialog<Data>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select option'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Data.firstOption);
                },
                child: const Text('First Option'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Data.secondOption);
                },
                child: const Text('Second Option'),
              ),
            ],
          );
        })) {
      case Data.firstOption:
        showToast("First Option");
        break;
      case Data.secondOption:
        showToast("Second Option");
        break;
      case null:
        // dialog dismissed
        break;
    }
  }
}

enum Data {
  firstOption,
  secondOption,
}
