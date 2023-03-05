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
import 'package:fluttertoast/fluttertoast.dart';

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
            margin: setMargin(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                getSizedBox(16),
                getElevatedButton(
                  "Simple Listview",
                  onPressed: () {
                    navigateToListScreen(context, SimpleListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Single Item Selection Listview",
                  onPressed: () {
                    navigateToListScreen(
                        context, SingleItemSelectionListViewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Multiple Items Selection Listview",
                  onPressed: () {
                    navigateToListScreen(
                        context, MultipleItemsSelectionListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Horizontal Listview",
                  onPressed: () {
                    navigateToListScreen(context, HorizontalListViewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Grid Listview",
                  onPressed: () {
                    navigateToListScreen(context, GridViewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Staggered Listview",
                  onPressed: () {
                    navigateToListScreen(context, StaggeredListViewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Drag Drop Item Listview",
                  onPressed: () {
                    navigateToListScreen(context, DragDropItemListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Swipe Item To Delete Listview",
                  onPressed: () {
                    navigateToListScreen(
                        context, SwipeToDeleteItemListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Different View Types Listview",
                  onPressed: () {
                    navigateToListScreen(context, ViewTypeListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Expandable Listview",
                  onPressed: () {
                    navigateToListScreen(context, ExpandableListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Nested Listview",
                  onPressed: () {
                    navigateToListScreen(context, NestedListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Swipe To Refresh Listview",
                  onPressed: () {
                    navigateToListScreen(
                        context, SwipeToRefreshListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Radio Button Listview",
                  onPressed: () {
                    navigateToListScreen(context, RadioButtonListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Checkbox Listview",
                  onPressed: () {
                    navigateToListScreen(context, CheckboxListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Shimmer Listview",
                  onPressed: () {
                    navigateToListScreen(context, ShimmerListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Search Filter Listview",
                  onPressed: () {
                    navigateToListScreen(context, SearchFilterListviewScreen());
                  },
                ),
                getSizedBox(16),
                getElevatedButton(
                  "Pagination Listview",
                  onPressed: () {
                    navigateToListScreen(context, PaginationListviewScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigateToListScreen(BuildContext context, StatefulWidget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}

// class GetUI extends StatelessWidget {
//   const GetUI({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           getSizedBox(16),
//           getElevatedButton(
//             "Simple Listview",
//             onPressed: navigateTo(context, SimpleListviewScreen()),
//           ),
// //_Button("Simple Listview", SimpleListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton(
//             "Single Item Selection Listview",
//             onPressed: navigateTo(context, SingleItemSelectionListViewScreen()),
//           ),
// //_Button("Single Item Selection Listview", SingleItemSelectionListViewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Multiple Items Selection Listview",
//               onPressed:
//                   navigateTo(context, MultipleItemsSelectionListviewScreen())),
// //_Button("Multiple Items Selection Listview", MultipleItemsSelectionListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Horizontal Listview",
//               onPressed: navigateTo(context, HorizontalListViewScreen())),
// //_Button("Horizontal Listview", HorizontalListViewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Grid Listview",
//               onPressed: navigateTo(context, GridViewScreen())),
// //_Button("Grid View", GridViewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Staggered Listview",
//               onPressed: navigateTo(context, StaggeredListViewScreen())),
// //_Button("Staggered Listview", StaggeredListViewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Drag Drop Item Listview",
//               onPressed: navigateTo(context, DragDropItemListviewScreen())),
// //_Button("Drag Drop Item Listview", DragDropItemListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Swipe Item To Delete Listview",
//               onPressed:
//                   navigateTo(context, SwipeToDeleteItemListviewScreen())),
// //_Button("Swipe Item To Delete Listview",SwipeToDeleteItemListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Different View Types Listview",
//               onPressed: navigateTo(context, ViewTypeListviewScreen())),
// //_Button("Different View Types Listview", ViewTypeListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Expandable Listview",
//               onPressed: navigateTo(context, ExpandableListviewScreen())),
// //_Button("Expandable Listview", ExpandableListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Nested Listview",
//               onPressed: navigateTo(context, NestedListviewScreen())),
// //_Button("Nested Listview", NestedListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Swipe To Refresh Listview",
//               onPressed: navigateTo(context, SwipeToRefreshListviewScreen())),
// //_Button("Swipe To Refresh Listview", SwipeToRefreshListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Radio Button Listview",
//               onPressed: navigateTo(context, RadioButtonListviewScreen())),
// //_Button("Radio Button Listview", RadioButtonListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Checkbox Listview",
//               onPressed: navigateTo(context, CheckboxListviewScreen())),
// //_Button("Checkbox Listview", CheckboxListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Shimmer Listview",
//               onPressed: navigateTo(context, ShimmerListviewScreen())),
// //_Button("Shimmer Listview", ShimmerListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Search Filter Listview",
//               onPressed: navigateTo(context, SearchFilterListviewScreen())),
// //_Button("Search Filter Listview", SearchFilterListviewScreen()),
//           getSizedBox(16),
//           getElevatedButton("Pagination Listview",
//               onPressed: navigateTo(context, PaginationListviewScreen())),
// //_Button("Pagination Listview", PaginationListviewScreen()),
//         ],
//       ),
//     );
//   }
//
//   navigateTo(BuildContext context, StatefulWidget screen) {
//     Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
//   }
// }

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
