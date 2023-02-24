import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';

class HelloWorldScreen extends StatefulWidget {
  const HelloWorldScreen({Key? key}) : super(key: key);

  @override
  State<HelloWorldScreen> createState() => _HelloWorldScreenState();
}

class _HelloWorldScreenState extends State<HelloWorldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Hello World"),
      body: const Center(
        child: Text(
          "Hello World!",
          style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
