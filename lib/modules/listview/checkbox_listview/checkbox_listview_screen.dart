import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

import '../../common_widgets/common_widgets.dart';

class CheckboxListviewScreen extends StatefulWidget {
  const CheckboxListviewScreen({Key? key}) : super(key: key);

  @override
  State<CheckboxListviewScreen> createState() => _CheckboxListviewScreenState();
}

class _CheckboxListviewScreenState extends State<CheckboxListviewScreen> {
  final List<String> list = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];

  List<bool> selectedCheckboxes = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Checkbox Listview"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (contex, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        width: 1.0,
                        style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  borderOnForeground: true,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            list[index],
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Checkbox(
                            value: selectedCheckboxes[index],
                            onChanged: (bool? value) {
                              setState(() {
                                selectedCheckboxes[index] = value!;
                                for (int i = 0;
                                    i < selectedCheckboxes.length;
                                    i++) {
                                  if (selectedCheckboxes[i] == true) {
                                    showToast(list[i]);
                                  }
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
