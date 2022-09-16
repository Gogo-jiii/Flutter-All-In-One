import 'package:flutter/material.dart';

import '../../common_widgets/common_widgets.dart';
import '../../toast/toast_screen.dart';

class PaginationListviewScreen extends StatefulWidget {
  const PaginationListviewScreen({Key? key}) : super(key: key);

  @override
  State<PaginationListviewScreen> createState() =>
      _PaginationListviewScreenState();
}

class _PaginationListviewScreenState extends State<PaginationListviewScreen> {
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

  final List<String> newList = ["1", "2", "3", "4", "5"];

  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setupPagination();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Pagination Listview"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ListView.builder(
              controller: _scrollController,
              itemCount: list.length,
              itemBuilder: (contex, index) {
                return GestureDetector(
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
                      showToast("Selected : ${list[index]}");
                    });
              }),
        ),
      ),
    );
  }

  void setupPagination() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        showToast("Loading more...");

        setState(() {
          list.addAll(newList);
        });
      }
    });
  }
}
