import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../toast/toast_screen.dart';

class StaggeredListViewScreen extends StatefulWidget {
  const StaggeredListViewScreen({Key? key}) : super(key: key);

  @override
  State<StaggeredListViewScreen> createState() =>
      _StaggeredListViewScreenState();
}

class _StaggeredListViewScreenState extends State<StaggeredListViewScreen> {
  final List<String> list = [
    "a",
    "b\nb\nb",
    "c",
    "d",
    "e",
    "f\nf\nf",
    "g",
    "h",
    "i\ni\ni",
    "j\nj\nj",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p\np\np",
    "q",
    "r\nr\nr",
    "s",
    "t",
    "u",
    "v\nv\nv",
    "w\nw\nw",
    "x",
    "y",
    "z",
    "a",
    "b\nb\nb",
    "c",
    "d",
    "e",
    "f\nf\nf",
    "g",
    "h",
    "i\ni\ni",
    "j\nj\nj",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p\np\np",
    "q",
    "r\nr\nr",
    "s",
    "t",
    "u",
    "v\nv\nv",
    "w\nw\nw",
    "x",
    "y",
    "z"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Staggered Listview"),
      body: MasonryGridView.count(
          itemCount: list.length,
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: Card(
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
                    child: Center(
                      child: Text(
                        list[index],
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
                  showToast("Selected : ${list[index]}");
                });
          }),
    );
  }
}
