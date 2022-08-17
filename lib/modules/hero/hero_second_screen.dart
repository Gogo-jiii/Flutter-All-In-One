import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

class HeroSecondScreen extends StatefulWidget {
  const HeroSecondScreen({Key? key}) : super(key: key);

  @override
  State<HeroSecondScreen> createState() => _HeroSecondScreenState();
}

class _HeroSecondScreenState extends State<HeroSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Hero Second Screen"),
      body: Center(
        child: Hero(
          tag: "hero_image",
          child: Image.asset(
            'assets/images/it_wala.jpg',
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
