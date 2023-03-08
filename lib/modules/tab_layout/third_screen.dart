import 'package:flutter/material.dart';

import '../theme/styles.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles().getPageBackgroundColor(),
      body: Center(
        child: Text(
          "Third Fragment",
          style: TextStyle(
            color: Styles().getTextColor(),
          ),
        ),
      ),
    );
  }
}
