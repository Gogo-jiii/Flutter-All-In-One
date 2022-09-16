import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class ButtonBarScreen extends StatefulWidget {
  const ButtonBarScreen({Key? key}) : super(key: key);

  @override
  State<ButtonBarScreen> createState() => _ButtonBarScreenState();
}

class _ButtonBarScreenState extends State<ButtonBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Button Bar"),
      body: Center(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showToast("Clicked 1");
              },
              child: const Text("Button 1"),
            ),
            ElevatedButton(
              onPressed: () {
                showToast("Clicked 2");
              },
              child: const Text("Button 2"),
            ),
            ElevatedButton(
              onPressed: () {
                showToast("Clicked 3");
              },
              child: const Text("Button 3"),
            ),
            ElevatedButton(
              onPressed: () {
                showToast("Clicked 4");
              },
              child: const Text("Button 4"),
            ),
          ],
        ),
      ),
    );
  }
}
