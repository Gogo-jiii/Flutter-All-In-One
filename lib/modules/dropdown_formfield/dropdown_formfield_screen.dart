import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class DropDownFormFieldScreen extends StatefulWidget {
  const DropDownFormFieldScreen({Key? key}) : super(key: key);

  @override
  State<DropDownFormFieldScreen> createState() =>
      _DropDownFormFieldScreenState();
}

class _DropDownFormFieldScreenState extends State<DropDownFormFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Dropdown Form Field"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            hint: const Text("Select an Item"),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            elevation: 16,
            icon: const Icon(
              Icons.arrow_circle_down,
              color: Colors.green,
            ),
            dropdownColor: Colors.green,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            items: <String>['One', 'Two', 'Three', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              showToast(value!);
            },
          ),
        ),
      ),
    );
  }
}
