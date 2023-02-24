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
  List<String> items = ['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Dropdown Button"),
      body: Center(
        child: getDropDownButton(items, dropdownValue,
          onChanged: (String? value) {
            setState(() {
                dropdownValue = value!;
                showToast("Selected $dropdownValue");
              },
            );
          },
        ),
      ),
    );
  }
}
