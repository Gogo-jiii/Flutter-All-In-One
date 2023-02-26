import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class FlexibleWidgetScreen extends StatefulWidget {
  const FlexibleWidgetScreen({Key? key}) : super(key: key);

  @override
  State<FlexibleWidgetScreen> createState() => _FlexibleWidgetScreenState();
}

class _FlexibleWidgetScreenState extends State<FlexibleWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Flexible Widget"),
      body: Container(
        margin: setMargin(16),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getElevatedButton("Button 1", onPressed: () {
                  showToast("Button 1 clicked.");
                }),
              ),
            ),
            getSizedBox(16),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getElevatedButton("Button 2", onPressed: () {
                  showToast("Button 2 clicked.");
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
