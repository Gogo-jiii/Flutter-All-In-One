import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';
import '../toast/toast_screen.dart';

class TextButtonScreen extends StatefulWidget {
  const TextButtonScreen({Key? key}) : super(key: key);

  @override
  State<TextButtonScreen> createState() => _TextButtonScreenState();
}

class _TextButtonScreenState extends State<TextButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, "Text Button"),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 32),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    showToast("Text Button is clicked.");
                  },
                  child: const Text(
                    "Text Button",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 32),
                const TextButton(
                  onPressed: null,
                  child: Text(
                    "Disabled Text Button",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 32),
                TextButton.icon(
                    onPressed: () {
                      showToast("Icon Text Button is clicked.");
                    },
                    icon: const Icon(Icons.account_circle),
                    label: const Text("Icon Text Button"))
              ],
            ),
          ),
        ));
  }
}
