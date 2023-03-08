import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class PictureInPictureScreen extends StatefulWidget {
  const PictureInPictureScreen({Key? key}) : super(key: key);

  @override
  State<PictureInPictureScreen> createState() => _PictureInPictureScreenState();
}

class _PictureInPictureScreenState extends State<PictureInPictureScreen>
    with WidgetsBindingObserver {
  final floating = Floating();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    floating.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState == AppLifecycleState.inactive) {
      floating.enable(Rational.square());
    }
  }

  Future<void> enablePip() async {
    final status = await floating.enable(Rational.landscape());
    debugPrint('PiP enabled? $status');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Picture in Picture"),
      body: PiPSwitcher(
        childWhenDisabled: Container(
          margin: setMargin(16),
          child: Center(
            child: getElevatedButton(
              "Click to enable Pip Mode",
              onPressed: () {
                gotoPipMode();
              },
            ),
          ),
        ),
        childWhenEnabled: const Text('Pip enabled'),
      ),
    );
  }

  void gotoPipMode() {
    floating.isPipAvailable.then((value) => {enablePip()});
  }
}
