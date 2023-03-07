import 'package:flutter/material.dart';

import '../../common_widgets/common_widgets.dart';
import '../../theme/styles.dart';
import '../../toast/toast_screen.dart';

class SingleItemSelectionListViewScreen extends StatefulWidget {
  const SingleItemSelectionListViewScreen({Key? key}) : super(key: key);

  @override
  State<SingleItemSelectionListViewScreen> createState() =>
      _SingleItemSelectionListViewScreenState();
}

class _SingleItemSelectionListViewScreenState
    extends State<SingleItemSelectionListViewScreen> {
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

  int _singleitemSelectionPosition = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Single Item Selection Listview"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (contex, index) {
                return GestureDetector(
                    child: Card(
                      color: _singleitemSelectionPosition == index
                          ? Colors.blueAccent
                          : Styles().getCardColor(),
                      margin: const EdgeInsets.all(8),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
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
                          child: Text(
                            list[index],
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _singleitemSelectionPosition = index;
                        //list[index].isSelected = !list[index].isSelected;
                      });
                      showToast("Selected : ${list[index]}");
                    });
              }),
        ),
      ),
    );
  }
}
