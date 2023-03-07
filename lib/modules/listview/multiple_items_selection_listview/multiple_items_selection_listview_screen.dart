import 'package:flutter/material.dart';

import '../../common_widgets/common_widgets.dart';
import '../../theme/styles.dart';
import 'model_class.dart';

class MultipleItemsSelectionListviewScreen extends StatefulWidget {
  const MultipleItemsSelectionListviewScreen({Key? key}) : super(key: key);

  @override
  State<MultipleItemsSelectionListviewScreen> createState() =>
      _MultipleItemsSelectionListviewScreenState();
}

class _MultipleItemsSelectionListviewScreenState
    extends State<MultipleItemsSelectionListviewScreen> {
  final List<String> _stringList = [
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

  List<ModelClass> list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Multiple Items Selection Listview"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (contex, index) {
                return GestureDetector(
                    child: Card(
                      color: list[index].isSelected
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
                            list[index].name,
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
                        list[index].isSelected = !list[index].isSelected;
                      });
                    });
              }),
        ),
      ),
    );
  }

  void getData() {
    for (String item in _stringList) {
      list.add(ModelClass(item, false));
    }
  }
}
