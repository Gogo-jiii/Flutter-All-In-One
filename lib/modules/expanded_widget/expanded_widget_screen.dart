import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class ExpandedWidgetScreen extends StatefulWidget {
  const ExpandedWidgetScreen({Key? key}) : super(key: key);

  @override
  State<ExpandedWidgetScreen> createState() => _ExpandedWidgetScreenState();
}

class _ExpandedWidgetScreenState extends State<ExpandedWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Expanded Widget"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  showToast("Button 1 clicked");
                },
                child: const Text("Button 1"),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  showToast("Button 2 clicked");
                },
                child: const Text("Button 2"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
