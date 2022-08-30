import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({Key? key}) : super(key: key);

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Date Picker"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _showDatePicker();
            },
            child: const Text("Date Picker"),
          ),
        ),
      ),
    );
  }

  _showDatePicker() async {
    final DateTime? selected = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    if (selected != null) {
      setState(() {
        selectedDate = selected;

        showToast(
            "Date : ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}");
      });
    }
  }
}
