import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

import '../theme/styles.dart';

class ProgressIndicatorScreen extends StatefulWidget {
  const ProgressIndicatorScreen({Key? key}) : super(key: key);

  @override
  State<ProgressIndicatorScreen> createState() =>
      _ProgressIndicatorScreenState();
}

class _ProgressIndicatorScreenState extends State<ProgressIndicatorScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Progress Indicator"),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              LinearProgressIndicator(
                backgroundColor: Styles().getLinearProgressIndicatorBackgroundColor(Colors.green),
                color: Styles().getProgressIndicatorBackgroundColor(Colors.red),
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              ),
              getSizedBox(16),
              CircularProgressIndicator(
                color: Styles().getProgressIndicatorBackgroundColor(Colors.orange),
                value: controller.value,
                semanticsLabel: 'Circular progress indicator',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
