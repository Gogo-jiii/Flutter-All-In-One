import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class FingerPrintAuth extends StatefulWidget {
  const FingerPrintAuth({Key? key}) : super(key: key);

  @override
  State<FingerPrintAuth> createState() => _FingerPrintAuthState();
}

class _FingerPrintAuthState extends State<FingerPrintAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Finger Print Auth"),
      body: Container(
        margin: EdgeInsets.all(16),
      ),
    );
  }
}
