import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/button/outlinebutton_screen.dart';
import 'package:flutter_all_in_one/modules/common_widgets/common_widgets.dart';

import 'elevatedbutton_screen.dart';
import 'textbutton_screen.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  var data = ["Elevated Button", "Text Button", "Outline Button"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Button"),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                navigate(context, index);
              },
              child: getListItem(context, data, index),
            );
          }),
    );
  }
}

void navigate(BuildContext context, int index) {
  var type = getListItemType(index);
  switch (type) {
    case ButtonItemsType.elevatedButton:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const ElevatedButtonScreen()));
      break;
    case ButtonItemsType.textButton:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const TextButtonScreen()));
      break;
    case ButtonItemsType.outlineButton:
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const OutlineButtonScreen()));
      break;
  }
}

enum ButtonItemsType { elevatedButton, textButton, outlineButton }

ButtonItemsType getListItemType(int index) {
  return ButtonItemsType.values[index];
}
