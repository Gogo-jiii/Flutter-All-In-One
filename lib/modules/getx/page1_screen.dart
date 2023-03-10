import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';
import 'package:get/get.dart';

import 'model_class.dart';

class Page1Screen extends StatefulWidget {
  String name;

  Page1Screen({Key? key, required this.name}) : super(key: key);

  @override
  State<Page1Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {
  String _city = "";

  @override
  void initState() {
    Get.put(ModelClass1());
    ModelClass1 model = Get.find();
    setState(() {
      if (model.city.isNotEmpty) _city = model.city;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Page 1"),
      body: Center(
        child: Text("Page 1 \n${widget.name}\nCity:${_city}"),
      ),
    );
  }
}
