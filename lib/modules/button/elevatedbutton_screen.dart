import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';
import '../toast/toast_screen.dart';

class ElevatedButtonScreen extends StatefulWidget {
  const ElevatedButtonScreen({Key? key}) : super(key: key);

  @override
  State<ElevatedButtonScreen> createState() => _ElevatedButtonScreenState();
}

class _ElevatedButtonScreenState extends State<ElevatedButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, "Elevated Button"),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 32),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showToast("Elevated Button is clicked.");
                  },
                  child: const Text(
                    "Elevated Button",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 32),
                const ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Disabled Elevated Button",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                    onPressed: () {
                      showToast("Icon Elevated Button is clicked.");
                    },
                    icon: const Icon(Icons.account_circle),
                    label: const Text("Icon Elevated Button")),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showToast("Full Width Elevated Button is clicked.");
                    },
                    child: const Text(
                      "Full Width Elevated Button",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
