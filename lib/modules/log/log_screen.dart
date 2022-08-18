import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({Key? key}) : super(key: key);

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  var a = "SOME LOG 1";
  var b = "SOME LOG 2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Log"),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint("TAG : $a");
            debugPrint("TAG : $b");
            showToast("See the logcat for logs.");
          },
          child: const Text("Click to see log"),
        ),
      ),
    );
  }
}
