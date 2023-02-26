import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';
import '../theme/styles.dart';

class SnackBarScreen extends StatefulWidget {
  const SnackBarScreen({Key? key}) : super(key: key);

  @override
  State<SnackBarScreen> createState() => _SnackBarScreenState();
}

class _SnackBarScreenState extends State<SnackBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Snack Bar"),
      body: Center(
        child: TextButton(
          onPressed: () {
            showSnackBar(context, "This is a Snack Bar");
          },
          child:  Text(
            "Show Snack Bar",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Styles().getTextColor()),
          ),
        ),
      ),
    );
  }
}


