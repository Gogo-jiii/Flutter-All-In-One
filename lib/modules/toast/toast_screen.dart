import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common_widgets/common_widgets.dart';

class ToastScreen extends StatefulWidget {
  const ToastScreen({Key? key}) : super(key: key);

  @override
  State<ToastScreen> createState() => _ToastScreenState();
}

class _ToastScreenState extends State<ToastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toast"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          showToast();
        },
        child: Center(
          child: getCardButton(context, "Show Toast"),
        ),
      ),
    );
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: "This is a Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
