import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

import '../../common_widgets/common_widgets.dart';

class HorizontalListViewScreen extends StatefulWidget {
  const HorizontalListViewScreen({Key? key}) : super(key: key);

  @override
  State<HorizontalListViewScreen> createState() =>
      _HorizontalListViewScreenState();
}

class _HorizontalListViewScreenState extends State<HorizontalListViewScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Horizontal Listview"),
      body: Container(
          margin: const EdgeInsets.all(16),
          child: Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: list.map((data) {
                return GestureDetector(
                  onTap: () {
                    showToast("Selected: $data");
                  },
                  child: box(data),
                );
              }).toList(),
            ),
          )),
    );
  }

  Widget box(String title) {
    return Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(title, style: const TextStyle(fontSize: 20)));
  }
}
