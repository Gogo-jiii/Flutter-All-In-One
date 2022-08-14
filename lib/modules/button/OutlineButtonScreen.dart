import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';
import '../toast/toast_screen.dart';

class OutlineButtonScreen extends StatefulWidget {
  const OutlineButtonScreen({Key? key}) : super(key: key);

  @override
  State<OutlineButtonScreen> createState() => _OutlineButtonScreenState();
}

class _OutlineButtonScreenState extends State<OutlineButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, "Outline Button"),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 32),
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    showToast("Outline Button is clicked.");
                  },
                  child: const Text(
                    "Outline Button",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 32),
                const OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "Disabled Outline Button",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 32),
                OutlinedButton.icon(
                    onPressed: () {
                      showToast("Icon Outline Button is clicked.");
                    },
                    icon: const Icon(Icons.account_circle),
                    label: const Text("Icon Outline Button"))
              ],
            ),
          ),
        ));
  }
}
