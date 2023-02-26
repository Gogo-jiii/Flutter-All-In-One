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
        margin: setMargin(16),
        child: Center(
          child: getDropDownFormField(
            onChanged: (String? value) {
              showToast(value!);
            },
          ),
        ),
      ),
    );
  }
}
