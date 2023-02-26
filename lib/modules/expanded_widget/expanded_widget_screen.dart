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
        margin: setMargin(16),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getElevatedButton("Button 1", onPressed: () {
                  showToast("Button 1 clicked");
                }),
              ),
            ),
            getSizedBox(16),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getElevatedButton("Button 2", onPressed: () {
                  showToast("Button 2 clicked");
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
