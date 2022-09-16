import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/listview/drag_drop_item_listview/drag_drop_item_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/expandable_listview/expandable_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/grid_view_listview/grid_view_screen.dart';
import 'package:flutter_all_in_one/modules/listview/multiple_items_selection_listview/multiple_items_selection_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/nested_listview/nested_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/pagination_listview/pagination_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/radio_button_listview/radio_button_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/search_filter_listview/search_filter_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/shimmer_listview/shimmer_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/simple_listview/simple_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/staggered_listview/staggered_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/swipe_to_delete_item_listview/swipe_to_delete_item_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/swipe_to_refresh_listview/swipe_to_refresh_listview_screen.dart';
import 'package:flutter_all_in_one/modules/listview/viewtypes_listview/viewtypes_listview_screen.dart';

import 'checkbox_listview/checkbox_listview_screen.dart';
import 'horizontal_listview/horizontal_listview_screen.dart';
import 'single_item_selection_listview/single_item_selection_listview_screen.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: const [
          _SizedBox(16),
          _Button("Simple Listview", SimpleListviewScreen()),
          _SizedBox(16),
          _Button("Single Item Selection Listview",
              SingleItemSelectionListViewScreen()),
          _SizedBox(16),
          _Button("Multiple Items Selection Listview",
              MultipleItemsSelectionListviewScreen()),
          _SizedBox(16),
          _Button("Horizontal Listview", HorizontalListViewScreen()),
          _SizedBox(16),
          _Button("Grid View", GridViewScreen()),
          _SizedBox(16),
          _Button("Staggered Listview", StaggeredListViewScreen()),
          _SizedBox(16),
          _Button("Drag Drop Item Listview", DragDropItemListviewScreen()),
          _SizedBox(16),
          _Button("Swipe Item To Delete Listview",
              SwipeToDeleteItemListviewScreen()),
          _SizedBox(16),
          _Button("Different View Types Listview", ViewTypeListviewScreen()),
          _SizedBox(16),
          _Button("Expandable Listview", ExpandableListviewScreen()),
          _SizedBox(16),
          _Button("Nested Listview", NestedListviewScreen()),
          _SizedBox(16),
          _Button("Swipe To Refresh Listview", SwipeToRefreshListviewScreen()),
          _SizedBox(16),
          _Button("Radio Button Listview", RadioButtonListviewScreen()),
          _SizedBox(16),
          _Button("Checkbox Listview", CheckboxListviewScreen()),
          _SizedBox(16),
          _Button("Shimmer Listview", ShimmerListviewScreen()),
          _SizedBox(16),
          _Button("Search Filter Listview", SearchFilterListviewScreen()),
          _SizedBox(16),
          _Button("Pagination Listview", PaginationListviewScreen()),
        ],
      ),
    );
  }
}

class _SizedBox extends StatelessWidget {
  final double value;

  const _SizedBox(
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}

class _Button extends StatelessWidget {
  final String title;
  final StatefulWidget screen;

  const _Button(
    this.title,
    this.screen, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
        },
        child: Text(title),
      ),
    );
  }
}
