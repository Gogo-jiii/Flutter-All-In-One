import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class DropDownButtonScreen extends StatefulWidget {
  const DropDownButtonScreen({Key? key}) : super(key: key);

  @override
  State<DropDownButtonScreen> createState() => _DropDownButtonScreenState();
}

class _DropDownButtonScreenState extends State<DropDownButtonScreen> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Dropdown Button"),
      body: Center(
        child: DropdownButton(
          dropdownColor: Colors.green,
          borderRadius: BorderRadius.circular(16),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          underline: Container(
            height: 2,
            color: Colors.green,
          ),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_circle_down),
          elevation: 8,
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
            setState(() {
              dropdownValue = value!;
              showToast("Selected $dropdownValue");
            });
          },
        ),
      ),
    );
  }
}
