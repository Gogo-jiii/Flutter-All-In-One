import 'package:flutter/material.dart';

import '../../common_widgets/common_widgets.dart';

class DragDropItemListviewScreen extends StatefulWidget {
  const DragDropItemListviewScreen({Key? key}) : super(key: key);

  @override
  State<DragDropItemListviewScreen> createState() =>
      _DragDropItemListviewScreenState();
}

class _DragDropItemListviewScreenState
    extends State<DragDropItemListviewScreen> {
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
      appBar: getAppBar(context, "Drag Drop Item Listview"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                _reorder(oldIndex, newIndex);
              });
            },
            children: <Widget>[
              for (final items in list)
                Card(
                  key: ValueKey(items),
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
                      child: Text(
                        items,
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
            ],
          ),
        ),
      ),
    );
  }

  void _reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final String item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
  }
}
