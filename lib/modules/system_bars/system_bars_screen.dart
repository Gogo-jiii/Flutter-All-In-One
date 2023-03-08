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
            getElevatedButton(
              "Hide Status Bar",
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: [SystemUiOverlay.bottom]);
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Hide Navigation Bar",
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: [SystemUiOverlay.top]);
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Hide Status & Navigation Bar",
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
              },
            ),
            getSizedBox(16),
            getElevatedButton(
              "Show Status/Navigation Bar",
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: SystemUiOverlay.values);
              },
            ),
          ],
        ),
      ),
    );
  }
}
