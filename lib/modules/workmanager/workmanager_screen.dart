import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

import '../toast/toast_screen.dart';

const simpleTaskKey = "simple_task";
const periodicTaskKey = "periodic_task";
const inputDataTaskKey = "input_data_task";
const delayedTaskKey = "delayed_task";
const backgroundTaskKey = "background_task";

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case simpleTaskKey:
        debugPrint("TAG : Simple TASK");
        showToast("background task");
        break;
      case periodicTaskKey:
        showToast("Periodic Task");
        break;
      case inputDataTaskKey:
        var data = inputData!['name'];
        showToast("Input Data: $data");
        break;
      case delayedTaskKey:
        showToast("Delayed Task");
        debugPrint("TAG : DELAYED TASK");
        break;
      case backgroundTaskKey:
        debugPrint("TAG : BACKGROUND TASK");

        var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
          "a",
          "b",
          channelDescription: "c",
          importance: Importance.max,
          color: Colors.green,
          priority: Priority.max,
          enableVibration: true,
          enableLights: true,
          onlyAlertOnce: true,
          ongoing: true,
        );

        var platformChannelSpecifics =
            NotificationDetails(android: androidPlatformChannelSpecifics);

        var initializationSettingsAndroid =
            const AndroidInitializationSettings("@mipmap/ic_launcher");
        var initializationSettings =
            InitializationSettings(android: initializationSettingsAndroid);
        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();
        await flutterLocalNotificationsPlugin
            .initialize(initializationSettings);

        showOnGoingNotification(flutterLocalNotificationsPlugin,
            platformChannelSpecifics, DateTime.now().millisecondsSinceEpoch);

        for (int i = 0; i < 100; i++) {
          showOnGoingNotification(flutterLocalNotificationsPlugin,
              platformChannelSpecifics, DateTime.now().millisecondsSinceEpoch);
          sleep(
            const Duration(seconds: 5),
          );
        }

        break;
    }
    return Future.value(true);
  });
}

void showOnGoingNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    NotificationDetails platformChannelSpecifics,
    int millisecondsSinceEpoch) async {
  await flutterLocalNotificationsPlugin.show(
    0,
    'New Post',
    'Foreground Notification: $millisecondsSinceEpoch',
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}

class WorkManagerScreen extends StatefulWidget {
  const WorkManagerScreen({Key? key}) : super(key: key);

  @override
  State<WorkManagerScreen> createState() => _WorkManagerScreenState();
}

class _WorkManagerScreenState extends State<WorkManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Work Manager"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              getSizedBox(16),
              Text(
                "Plugin initialization",
                style: Theme.of(context).textTheme.headline5,
              ),
              getElevatedButton(
                "Start the Flutter Work Manager",
                onPressed: () {
                  Workmanager().initialize(
                    callbackDispatcher,
                    isInDebugMode: true,
                  );
                },
              ),
              getSizedBox(16),
              getElevatedButton(
                "Register OneOff Task",
                onPressed: () {
                  Workmanager()
                      .registerOneOffTask(simpleTaskKey, simpleTaskKey);
                },
              ),
              getElevatedButton(
                "Register Periodic Task",
                onPressed: () {
                  Workmanager()
                      .registerPeriodicTask(periodicTaskKey, periodicTaskKey);
                },
              ),
              getElevatedButton(
                "Register Input Data Task",
                onPressed: () {
                  Workmanager().registerOneOffTask(
                    inputDataTaskKey,
                    inputDataTaskKey,
                    inputData: <String, dynamic>{
                      'name': 'vaibhav',
                    },
                  );
                },
              ),
              getElevatedButton(
                "Register Delayed Task",
                onPressed: () {
                  Workmanager().registerOneOffTask(
                    delayedTaskKey,
                    delayedTaskKey,
                    initialDelay: const Duration(seconds: 10),
                  );
                },
              ),
              getElevatedButton(
                "Register Background Task",
                onPressed: () {
                  Workmanager().registerOneOffTask(
                    backgroundTaskKey,
                    backgroundTaskKey,
                  );
                },
              ),
              getSizedBox(16),
              Text(
                "Task cancellation",
                style: Theme.of(context).textTheme.headline5,
              ),
              getElevatedButton(
                "Cancel All",
                onPressed: () {
                  cancelAllWorks();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cancelAllWorks() async {
    await Workmanager().cancelAll();
    debugPrint('Cancel all tasks completed');
  }
}
