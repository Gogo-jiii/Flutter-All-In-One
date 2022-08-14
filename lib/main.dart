import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/modules/button/ButtonScreen.dart';
import 'package:flutter_all_in_one/modules/hello_world/HelloWorldScreen.dart';
import 'package:flutter_all_in_one/modules/image/ImageScreen.dart';
import 'package:flutter_all_in_one/modules/slider/SliderScreen.dart';
import 'package:flutter_all_in_one/modules/snackbar/snackbar_screen.dart';
import 'package:flutter_all_in_one/modules/text_field/TextFieldScreen.dart';
import 'package:flutter_all_in_one/modules/toast/toast_screen.dart';

import 'modules/common_widgets/common_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter All in One'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [
    "Hello World",
    "Snack Bar",
    "Toast",
    "Button",
    "Text Field",
    "Slider",
    "Image"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: getListItem(context, data, index),
                onTap: () {
                  navigate(context, index);
                });
          }),
    );
  }
}

void navigate(BuildContext context, int index) {
  var type = getListItemType(index);
  switch (type) {
    case DashboardItemsType.helloWorld:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HelloWorldScreen()));
      break;
    case DashboardItemsType.snackBar:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SnackBarScreen()));
      break;
    case DashboardItemsType.toast:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ToastScreen()));
      break;
    case DashboardItemsType.button:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ButtonScreen()));
      break;
    case DashboardItemsType.textField:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const TextFieldScreen()));
      break;
    case DashboardItemsType.slider:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SliderScreen()));
      break;
    case DashboardItemsType.image:
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ImageScreen()));
      break;
  }
}

enum DashboardItemsType {
  helloWorld,
  snackBar,
  toast,
  button,
  textField,
  slider,
  image;
}

DashboardItemsType getListItemType(int index) {
  return DashboardItemsType.values[index];
}
