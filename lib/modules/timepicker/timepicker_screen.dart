import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

import '../toast/toast_screen.dart';

class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({Key? key}) : super(key: key);

  @override
  State<TimePickerScreen> createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Time Picker"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showTimePikcer();
            },
            child: const Text("Time Picker"),
          ),
        ),
      ),
    );
  }

  void showTimePikcer() async {
    final TimeOfDay? selected = await showTimePicker(
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedTime = selected;

        showToast("Time : ${selectedTime.hour}:${selectedTime.minute}");
      });
    }
  }
}
