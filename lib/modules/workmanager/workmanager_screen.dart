import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:workmanager/workmanager.dart';

import '../../main.dart';

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
              Text(
                "Plugin initialization",
                style: Theme.of(context).textTheme.headline5,
              ),
              ElevatedButton(
                child: const Text("Start the Flutter Work Manager"),
                onPressed: () {
                  Workmanager().initialize(
                    callbackDispatcher,
                    isInDebugMode: true,
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text("Register OneOff Task"),
                onPressed: () {
                  Workmanager()
                      .registerOneOffTask(simpleTaskKey, simpleTaskKey);
                },
              ),
              ElevatedButton(
                child: const Text("Register Periodic Task"),
                onPressed: () {
                  Workmanager()
                      .registerPeriodicTask(periodicTaskKey, periodicTaskKey);
                },
              ),
              ElevatedButton(
                child: const Text("Register Input Data Task"),
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
              ElevatedButton(
                child: const Text("Register Delayed Task"),
                onPressed: () {
                  Workmanager().registerOneOffTask(
                    delayedTaskKey,
                    delayedTaskKey,
                    initialDelay: const Duration(seconds: 10),
                  );
                },
              ),
              ElevatedButton(
                child: const Text("Register Background Task"),
                onPressed: () {
                  Workmanager().registerOneOffTask(
                    backgroundTaskKey,
                    backgroundTaskKey,
                  );
                },
              ),
              Text(
                "Task cancellation",
                style: Theme.of(context).textTheme.headline5,
              ),
              ElevatedButton(
                child: const Text("Cancel All"),
                onPressed: () async {
                  await Workmanager().cancelAll();
                  debugPrint('Cancel all tasks completed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
