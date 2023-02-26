import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';
import '../toast/toast_screen.dart';

class SpacerScreen extends StatefulWidget {
  const SpacerScreen({Key? key}) : super(key: key);

  @override
  State<SpacerScreen> createState() => _SpacerScreenState();
}

class _SpacerScreenState extends State<SpacerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Spacer"),
      body: Container(
        margin: setMargin(16),
        child: Column(
          children: [
            Row(
              children: [
                getElevatedButton("Button 1", onPressed: () {
                  showToast("Button 1 clicked");
                }),
                getSpacer(1),
                getElevatedButton("Button 2", onPressed: () {
                  showToast("Button 2 clicked");
                }),
                getSpacer(1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
