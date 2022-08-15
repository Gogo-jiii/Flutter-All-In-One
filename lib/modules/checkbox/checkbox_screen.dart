import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({Key? key}) : super(key: key);

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool checkboxValueA = false;
  bool checkboxValueB = false;
  bool checkboxValueC = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Checkbox"),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: checkboxValueA,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValueA = value!;

                        var isChecked = "";
                        if (checkboxValueA == true) {
                          isChecked = "checked";
                        } else {
                          isChecked = "un-checked";
                        }

                        showToast("A is $isChecked");
                      });
                    },
                  ),
                  const Text("A"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: checkboxValueB,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValueB = value!;

                        var isChecked = "";
                        if (checkboxValueB == true) {
                          isChecked = "checked";
                        } else {
                          isChecked = "un-checked";
                        }

                        showToast("B is $isChecked");
                      });
                    },
                  ),
                  const Text("B"),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: CheckboxListTile(
                    title: const Text("C"),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    subtitle: const Text("subtitle"),
                    selectedTileColor: Colors.green,
                    value: checkboxValueC,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValueC = value!;

                        var isChecked = "";
                        if (checkboxValueC == true) {
                          isChecked = "checked";
                        } else {
                          isChecked = "un-checked";
                        }
                        showToast("C is $isChecked");
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
