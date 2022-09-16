import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({Key? key}) : super(key: key);

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  bool _is_visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Visibility"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Visibility(
                visible: _is_visible,
                child: const Text(
                  "THIS IS SOME TEXT.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w100),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _is_visible = !_is_visible;
                  });
                },
                child: const Text("SHOW / HIDE TEXT"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
