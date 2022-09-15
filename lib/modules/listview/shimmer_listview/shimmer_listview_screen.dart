import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../common_widgets/common_widgets.dart';

class ShimmerListviewScreen extends StatefulWidget {
  const ShimmerListviewScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerListviewScreen> createState() => _ShimmerListviewScreenState();
}

class _ShimmerListviewScreenState extends State<ShimmerListviewScreen> {
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

  bool _is_shimmer_enabled = true;
  Color _baseColor = Colors.grey;
  Color _highlightColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Shimmer Listview"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (contex, index) {
                if (_is_shimmer_enabled) {
                  return showShimmerLayout(index);
                } else {
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
                        showToast(list[index]);
                      });
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cancel),
        onPressed: () {
          setState(() {
            _is_shimmer_enabled = false;
          });
        },
      ),
    );
  }

  Widget showShimmerLayout(int index) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: GestureDetector(
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
          onTap: () {}),
    );
  }
}
