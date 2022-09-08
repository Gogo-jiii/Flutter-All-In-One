import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/listview/viewtypes_listview/row_item.dart';

import '../../toast/toast_screen.dart';

class ViewTypeListviewScreen extends StatefulWidget {
  const ViewTypeListviewScreen({Key? key}) : super(key: key);

  @override
  State<ViewTypeListviewScreen> createState() => _ViewTypeListviewScreenState();
}

class _ViewTypeListviewScreenState extends State<ViewTypeListviewScreen> {
  final List<ListItem> list = [
    HeadingItem("Heading 1"),
    MessageItem("Message 1", "Body 1"),
    MessageItem("Message 2", "Body 2"),
    MessageItem("Message 3", "Body 3"),
    HeadingItem("Heading 2"),
    HeadingItem("Heading 3"),
    MessageItem("Message 4", "Body 4"),
    MessageItem("Message 5", "Body 5"),
    HeadingItem("Heading 4"),
    MessageItem("Message 6", "Body 6"),
    MessageItem("Message 7", "Body 7"),
    MessageItem("Message 8", "Body 8"),
    MessageItem("Message 9", "Body 9"),
    HeadingItem("Heading 5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Different View Types"),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return GestureDetector(
              onTap: () {
                if (list[index].runtimeType == HeadingItem) {
                  HeadingItem? item = list[index] as HeadingItem?;
                  showToast(item!.heading.toString());
                } else if (list[index].runtimeType == MessageItem) {
                  MessageItem? item = list[index] as MessageItem?;
                  showToast(
                      "${item!.sender.toString()} & ${item.body.toString()}");
                }
              },
              child: ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubtitle(context),
              ),
            );
          }),
    );
  }
}
