import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/theme/styles.dart';
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
      body: Center(
        child: getElevatedButton(
          "Show Toast",
          onPressed: () {
            showToast("This is a toast");
          },
        ),
      ),
    );
  }
}