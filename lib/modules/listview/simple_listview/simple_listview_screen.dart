import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class SimpleListviewScreen extends StatefulWidget {
  const SimpleListviewScreen({Key? key}) : super(key: key);

  @override
  State<SimpleListviewScreen> createState() => _SimpleListviewScreenState();
}

class _SimpleListviewScreenState extends State<SimpleListviewScreen> {
  List<String> list = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Simple Listview"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (contex, index) {
                return GestureDetector(
                    child: getListItem(context, list, index),
                    onTap: () {
                      showToast("Selected : ${list[index]}");
                    });
              }),
        ),
      ),
    );
  }
}
