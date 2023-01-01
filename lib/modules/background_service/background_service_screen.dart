import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class BackgroundServiceScreen extends StatefulWidget {
  const BackgroundServiceScreen({Key? key}) : super(key: key);

  @override
  State<BackgroundServiceScreen> createState() =>
      _BackgroundServiceScreenState();
}

class _BackgroundServiceScreenState extends State<BackgroundServiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Background Service"),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Do task"),
        ),
      ),
    );
  }
}
