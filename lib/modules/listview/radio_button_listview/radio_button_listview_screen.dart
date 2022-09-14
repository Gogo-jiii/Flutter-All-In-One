import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

import '../../common_widgets/common_widgets.dart';

class RadioButtonListviewScreen extends StatefulWidget {
  const RadioButtonListviewScreen({Key? key}) : super(key: key);

  @override
  State<RadioButtonListviewScreen> createState() =>
      _RadioButtonListviewScreenState();
}

class _RadioButtonListviewScreenState extends State<RadioButtonListviewScreen> {
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
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = list[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Radio Button Listview"),
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
                          Radio(
                            groupValue: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                                showToast("Selected: $selectedValue");
                              });
                            },
                            value: list[index],
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
