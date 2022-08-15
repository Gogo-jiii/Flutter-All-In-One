import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({Key? key}) : super(key: key);

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

enum GroupValue { A, B }

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  GroupValue selectedValue = GroupValue.A;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Radio Button"),
      body: Container(
        margin: const EdgeInsets.only(top: 32),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    groupValue: selectedValue,
                    onChanged: (GroupValue? value) {
                      setState(() {
                        selectedValue = value!;
                        showToast("A is selected.");
                      });
                    },
                    value: GroupValue.A,
                  ),
                  const Text("A"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    groupValue: selectedValue,
                    onChanged: (GroupValue? value) {
                      setState(() {
                        selectedValue = value!;
                        showToast("B is selected.");
                      });
                    },
                    value: GroupValue.B,
                  ),
                  const Text("B"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
