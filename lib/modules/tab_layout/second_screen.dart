import 'package:flutter/material.dart';

import '../theme/styles.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles().getPageBackgroundColor(),
      body: Center(
        child: Text(
          "Second Fragment",
          style: TextStyle(
            color: Styles().getTextColor(),
          ),
        ),
      ),
    );
  }
}
