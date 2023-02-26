import 'package:flutter/material.dart';
import '../common_widgets/common_widgets.dart';
import '../theme/styles.dart';

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
      body:  Center(
        child: Text(
          "Hello World!",
          style: TextStyle(
              color: Styles().getTextColor(),
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
