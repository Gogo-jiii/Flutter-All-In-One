import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/listview/nested_listview/row_item.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class NestedListviewScreen extends StatefulWidget {
  const NestedListviewScreen({Key? key}) : super(key: key);

  @override
  State<NestedListviewScreen> createState() => _NestedListviewScreenState();
}

class _NestedListviewScreenState extends State<NestedListviewScreen> {
  final List<String> data = [
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

  final List<String> subData = [
    "a1",
    "b1",
    "c1",
    "d1",
    "e1",
    "f1",
    "g1",
    "h1",
    "i1",
    "j1",
    "k1",
    "l1",
    "m1",
    "n1",
    "o1",
    "p1",
    "q1",
    "r1",
    "s1",
    "t1",
    "u1",
    "v1",
    "w1",
    "x1",
    "y1",
    "z1"
  ];

  List<RowItem> list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Nested Listview"),
      body:
          Container(margin: const EdgeInsets.all(16), child: _nestedListview()),
    );
  }

  Widget _nestedListview() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  child: Center(
                    child: Card(
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
                            list[index].title,
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
                  ),
                  onTap: () {
                    setState(() {
                      list[index].isExpanded = !list[index].isExpanded;
                      showToast(list[index].title);
                    });
                  },
                ),
                Visibility(
                  visible: list[index].isExpanded,
                  child: ListView.builder(
                      itemCount: list[index].children.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int childIndex) {
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              showToast(list[index].children[childIndex]);
                            },
                            child: Card(
                              margin: const EdgeInsets.all(8),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              borderOnForeground: true,
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    list[index].children[childIndex],
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }

  void getData() {
    for (String item in data) {
      list.add(RowItem(title: item, children: subData));
    }
  }
}
