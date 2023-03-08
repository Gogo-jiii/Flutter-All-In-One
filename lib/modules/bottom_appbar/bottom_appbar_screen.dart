import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

import '../theme/styles.dart';

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Bottom Appbar"),
      body: const Center(
        child: Text("Hello World!"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showToast("clicked");
          }),
      bottomNavigationBar: BottomAppBar(
        color: Styles().getAppbarColor(),
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                showToast("clicked.");
              },
              icon: const Icon(
                Icons.account_box,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                showToast("clicked.");
              },
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
