import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/listview/expandable_listview/row_item.dart';

class ExpandableListviewScreen extends StatefulWidget {
  const ExpandableListviewScreen({Key? key}) : super(key: key);

  @override
  State<ExpandableListviewScreen> createState() =>
      _ExpandableListviewScreenState();
}

class _ExpandableListviewScreenState extends State<ExpandableListviewScreen> {
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
  List<String> list1 = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Expandable Listview"),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(16), child: _expandableListview()),
      ),
    );
  }

  void getData() {
    for (int i = 0; i < data.length; i++) {
      list.add(RowItem(headerValue: data[i], expandedValue: subData[i]));
    }
  }

  Widget _expandableListview() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          list[index].isExpanded = !isExpanded;
        });
      },
      children: list.map<ExpansionPanel>((RowItem item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              margin: const EdgeInsets.all(16),
              child: ListTile(
                title: Text(item.headerValue),
              ),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: const Text('hello...'),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
