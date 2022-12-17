import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_background/flutter_background.dart';

class BackgroundTaskWithNotificationScreen extends StatefulWidget {
  const BackgroundTaskWithNotificationScreen({Key? key}) : super(key: key);

  @override
  State<BackgroundTaskWithNotificationScreen> createState() =>
      _BackgroundTaskWithNotificationScreenState();
}

class _BackgroundTaskWithNotificationScreenState
    extends State<BackgroundTaskWithNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Background Task With Notification"),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showNotification();
          },
          child: const Text("Show Notification"),
        ),
      ),
    );
  }

  void showNotification() async {
    const androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: "flutter_background example app",
      notificationText:
          "Background notification for keeping the example app running in the background",
      notificationImportance: AndroidNotificationImportance.Default,
      notificationIcon: AndroidResource(
          name: 'background_icon',
          defType: 'drawable'), // Default is ic_launcher from folder mipmap
    );
    bool success =
        await FlutterBackground.initialize(androidConfig: androidConfig);

    if (success) {
      bool hasPermissions = await FlutterBackground.hasPermissions;
      if (hasPermissions) {
        bool success = await FlutterBackground.enableBackgroundExecution();
      }
    }
  }
}
