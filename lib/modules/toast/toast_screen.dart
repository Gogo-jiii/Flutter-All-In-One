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
      appBar: getAppBar(context, "Toast"),
      body: GestureDetector(
        onTap: () {
          showToast("This is a toast.");
        },
        child: Center(
          child: getCardButton(context, "Show Toast"),
        ),
      ),
    );
  }
}

void showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
