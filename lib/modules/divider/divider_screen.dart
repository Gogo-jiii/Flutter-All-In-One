import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class DividerScreen extends StatefulWidget {
  const DividerScreen({Key? key}) : super(key: key);

  @override
  State<DividerScreen> createState() => _DividerScreenState();
}

class _DividerScreenState extends State<DividerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Divider"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showToast("Button 1 clicked");
              },
              child: const Text("Button 1"),
            ),
            const Divider(
              thickness: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showToast("Button 2 clicked");
              },
              child: const Text("Button 2"),
            ),
            const Divider(
              thickness: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showToast("Button 3 clicked");
              },
              child: const Text("Button 3"),
            ),
          ],
        ),
      ),
    );
  }
}
