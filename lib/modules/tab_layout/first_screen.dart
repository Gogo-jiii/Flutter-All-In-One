import 'package:flutter/material.dart';

import '../theme/styles.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles().getPageBackgroundColor(),
      body: Center(
        child: Text(
          "First Fragment",
          style: TextStyle(
            color: Styles().getTextColor(),
          ),
        ),
      ),
    );
  }
}
