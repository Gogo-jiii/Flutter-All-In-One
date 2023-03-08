import 'package:flutter/material.dart';

import '../theme/styles.dart';

class ScrollingToolbarScreen extends StatefulWidget {
  ScrollingToolbarScreen({Key? key}) : super(key: key);

  @override
  State<ScrollingToolbarScreen> createState() => _ScrollingToolbarScreenState();
}

class _ScrollingToolbarScreenState extends State<ScrollingToolbarScreen> {
  var scrollbar_options = ["Pin", "Float", "Snap and Float"];
  var scrollbar_options_value = [false, false, false];
  bool snap = false;
  bool pin = false;
  bool floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: pin,
            snap: snap,
            floating: floating,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text("Scrolling Toolbar"),
            expandedHeight: 200,
            flexibleSpace: const FlexibleSpaceBar(
              background: FlutterLogo(),
            ),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () {
                showMultipleChoiceAlertDialog();
              },
              child: const SizedBox(
                height: 50,
                child: Center(
                  child: Text('Click here for more.'),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 100.0,
                  child: Center(
                    child: Text('$index'),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  void showMultipleChoiceAlertDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Styles().getAlertDialogBackgroundColor(),
        elevation: 8,
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        title: const Text("Select Option"),
        content: StatefulBuilder(
          builder: (BuildContext context,
              void Function(void Function()) setStateNew) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: scrollbar_options_value[0],
                      onChanged: (bool? value) {
                        setState(() {
                          pin = value!;
                        });
                        setStateNew(() {
                          scrollbar_options_value[0] = value!;
                        });
                      },
                    ),
                    Text(scrollbar_options[0]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: scrollbar_options_value[1],
                      onChanged: (bool? value) {
                        setState(() {
                          floating = value!;
                          snap = snap && floating;
                        });
                        setStateNew(() {
                          scrollbar_options_value[1] = value!;
                        });
                      },
                    ),
                    Text(scrollbar_options[1]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: scrollbar_options_value[2],
                      onChanged: (bool? value) {
                        setState(() {
                          snap = value!;
                          floating = floating || snap;
                        });
                        setStateNew(() {
                          scrollbar_options_value[2] = value!;
                        });
                      },
                    ),
                    Text(scrollbar_options[2]),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () {
              Navigator.pop(context, "Ok");
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }
}
