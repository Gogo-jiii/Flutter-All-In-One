import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar(context, "Bottom Sheet"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                doModelBottomSheet();
              },
              child: const Text("Modal Bottom Sheet"),
            ),
            ElevatedButton(
              onPressed: () {
                doPersistentBottomSheet();
              },
              child: const Text("Persistent Bottom Sheet"),
            ),
          ],
        ),
      ),
    );
  }

  void doModelBottomSheet() {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Some Text"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Close"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void doPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet(elevation: 8, (context) {
      return SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Some Text"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ),
            ],
          ),
        ),
      );
    });
  }
}
