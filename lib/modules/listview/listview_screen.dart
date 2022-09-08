import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/listview/drag_drop_item_listview/drag_drop_item_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/expandable_listview/expandable_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/grid_view_listview/grid_view_screen.dart';
import 'package:flutter_all_in_one/modules/listview/horizontal_listview/horizontal_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/multiple_items_selection_listview/multiple_items_selection_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/staggered_listview/staggered_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/viewtypes_listview/viewtypes_listview_screen.dart';

import 'simple_listview/simple_listview_screen.dart';
import 'single_item_selection_listview/single_item_selection_listview_screen.dart';
import 'swipe_to_delete_item_listview/swipe_to_delete_item_listview_screen.dart';

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({Key? key}) : super(key: key);

  @override
  State<ListviewScreen> createState() => _ListviewScreenState();
}

class _ListviewScreenState extends State<ListviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Listview"),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 10,
        trackVisibility: true,
        interactive: true,
        radius: const Radius.circular(10),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: const Center(child: GetUI()),
          ),
        ),
      ),
    );
  }
}

class GetUI extends StatelessWidget {
  const GetUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const SimpleListviewScreen()));
          },
          child: const Text("Simple Listview"),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const SingleItemSelectionListViewScreen()));
          },
          child: const Text("Single Item Selection Listview"),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        const MultipleItemsSelectionListviewScreen()));
          },
          child: const Text("Multiple Items Selection Listview"),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const SwipeToDeleteItemListviewScreen()));
          },
          child: const Text("Swipe To Delete Item Listview"),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const DragDropItemListviewScreen()));
          },
          child: const Text("Drag Drop Item Listview"),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const HorizontalListViewScreen()));
          },
          child: const Text("Horizontal Listview"),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const GridViewScreen()));
          },
          child: const Text("Gridview"),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const StaggeredListViewScreen()));
          },
          child: const Text("Staggered Listview"),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ViewTypeListviewScreen()));
          },
          child: const Text("Different View Types Listview"),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ExpandableListviewScreen()));
          },
          child: const Text("Expandable Listview"),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
