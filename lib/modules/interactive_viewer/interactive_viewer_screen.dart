import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class InteractiveViewerScreen extends StatefulWidget {
  const InteractiveViewerScreen({Key? key}) : super(key: key);

  @override
  State<InteractiveViewerScreen> createState() =>
      _InteractiveViewerScreenState();
}

class _InteractiveViewerScreenState extends State<InteractiveViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Interactive Viewer"),
      body: InteractiveViewer(
        child: Center(
          child: ElevatedButton(
              onPressed: () {}, child: const Text("Drag and Zoom this button")),
        ),
      ),
    );
  }
}
