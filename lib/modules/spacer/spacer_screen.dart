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
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showToast("Button 1 clicked");
                  },
                  child: const Text("Button 1"),
                ),
                const Spacer(
                  flex: 1,
                ),
                ElevatedButton(
                  onPressed: () {
                    showToast("Button 2 clicked");
                  },
                  child: const Text("Button 2"),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
