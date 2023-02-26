import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

class DividerScreen extends StatefulWidget {
  const DividerScreen({Key? key}) : super(key: key);

  @override
  State<DividerScreen> createState() => _DividerScreenState();
}

class _DividerScreenState extends State<DividerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Divider"),
      body: Container(
        margin: setMargin(16),
        child: Column(
          children: [
            getElevatedButton("Button 1", onPressed: () {
              showToast("Button 1 clicked");
            }),
            getDivider(8),
            getElevatedButton("Button 2", onPressed: () {
              showToast("Button 2 clicked");
            }),
            getDivider(8),
            getElevatedButton("Button 3", onPressed: () {
              showToast("Button 3 clicked");
            }),
          ],
        ),
      ),
    );
  }
}
