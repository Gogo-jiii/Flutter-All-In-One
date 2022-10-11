import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class SystemBarsScreen extends StatefulWidget {
  const SystemBarsScreen({Key? key}) : super(key: key);

  @override
  State<SystemBarsScreen> createState() => _SystemBarsScreenState();
}

class _SystemBarsScreenState extends State<SystemBarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "System Bars"),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: [SystemUiOverlay.bottom]);
              },
              child: const Text("Hide Status Bar"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: [SystemUiOverlay.top]);
              },
              child: const Text("Hide Navigation Bar"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
              },
              child: const Text("Hide Status & Navigation Bar"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: SystemUiOverlay.values);
              },
              child: const Text("Show Status/Navigation Bar"),
            ),
          ],
        ),
      ),
    );
  }
}
