import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

import '../theme/styles.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double initialValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Slider"),
      body: Center(
        child: Slider(
          min: 0,
          max: 100,
          divisions: 100,
          label: initialValue.round().toString(),
          activeColor: Styles().getSliderActiveColor(),
          inactiveColor: Styles().getSliderInActiveColor(),
          thumbColor: Styles().getSliderThumbColor(),
          value: initialValue,
          onChanged: (double value) {
            setState(() {
              initialValue = value;
            });
          },
        ),
      ),
    );
  }
}
