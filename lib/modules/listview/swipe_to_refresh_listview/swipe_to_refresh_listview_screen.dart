import 'package:flutter/material.dart';

import '../../common_widgets/common_widgets.dart';
import '../../toast/toast_screen.dart';

class SwipeToRefreshListviewScreen extends StatefulWidget {
  const SwipeToRefreshListviewScreen({Key? key}) : super(key: key);

  @override
  State<SwipeToRefreshListviewScreen> createState() =>
      _SwipeToRefreshListviewScreenState();
}

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

class _SwipeToRefreshListviewScreenState
    extends State<SwipeToRefreshListviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Swipe To Refresh Listview"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 3), () {
                setState(() {
                  list.add("1");
                  list.add("2");
                  list.add("3");
                  list.add("4");
                  list.add("5");
                  showToast("Refreshed...");
                });
              });
            },
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (contex, index) {
                  return GestureDetector(
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
      ),
    );
  }
}
